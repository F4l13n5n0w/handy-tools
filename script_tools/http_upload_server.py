#!/usr/bin/env python3
"""
HTTP File Upload Server
Listens on port 80 and accepts file uploads via HTTP POST (multipart/form-data or raw body).
Compatible with curl uploads.

Usage:
  sudo python3 http_upload_server.py
  sudo python3 http_upload_server.py --port 80 --dir ./uploads

Client (curl) examples:
  curl -F "file=@photo.jpg" http://<server-ip>/upload
  curl --upload-file data.zip http://<server-ip>/upload
  curl -X POST --data-binary @report.pdf http://<server-ip>/upload
"""

import http.server
import argparse
import os
import sys
import cgi
from datetime import datetime

UPLOAD_DIR = "./uploads"


class UploadHandler(http.server.BaseHTTPRequestHandler):

    def log_message(self, format, *args):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(f"  [{timestamp}] {self.client_address[0]} - {format % args}")

    def do_GET(self):
        """Show a simple status page."""
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"HTTP Upload Server is running.\nPOST a file to /upload\n")

    def do_PUT(self):
        """Handle curl --upload-file (PUT with raw body)."""
        self._save_raw_body()

    def do_POST(self):
        """Handle curl -F (multipart) or curl --data-binary (raw POST body)."""
        content_type = self.headers.get("Content-Type", "")

        if "multipart/form-data" in content_type:
            self._save_multipart()
        else:
            self._save_raw_body()

    def _save_raw_body(self):
        """Save raw request body directly to a file (curl --upload-file or --data-binary)."""
        length = int(self.headers.get("Content-Length", 0))
        if length == 0:
            self._respond(400, "No content received.\n")
            return

        # Derive filename from URL path or generate one
        filename = os.path.basename(self.path.rstrip("/")) or f"upload_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        save_path = os.path.join(UPLOAD_DIR, filename)

        data = self.rfile.read(length)
        with open(save_path, "wb") as f:
            f.write(data)

        size_kb = len(data) / 1024
        print(f"  [+] Saved '{filename}' ({size_kb:.2f} KB) from {self.client_address[0]}")
        self._respond(200, f"Uploaded: {filename} ({len(data):,} bytes)\n")

    def _save_multipart(self):
        """Parse multipart/form-data and save uploaded file(s) (curl -F)."""
        content_type = self.headers.get("Content-Type", "")
        length = int(self.headers.get("Content-Length", 0))

        # Use cgi.FieldStorage to parse multipart
        environ = {
            "REQUEST_METHOD": "POST",
            "CONTENT_TYPE":   content_type,
            "CONTENT_LENGTH": str(length),
        }
        form = cgi.FieldStorage(fp=self.rfile, headers=self.headers, environ=environ)

        saved = []
        for field_name in form.keys():
            field = form[field_name]
            if field.filename:
                filename = os.path.basename(field.filename) or f"upload_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
                save_path = os.path.join(UPLOAD_DIR, filename)
                data = field.file.read()
                with open(save_path, "wb") as f:
                    f.write(data)
                size_kb = len(data) / 1024
                print(f"  [+] Saved '{filename}' ({size_kb:.2f} KB) from {self.client_address[0]}")
                saved.append(f"{filename} ({len(data):,} bytes)")

        if saved:
            self._respond(200, "Uploaded:\n" + "\n".join(saved) + "\n")
        else:
            self._respond(400, "No file found in multipart form.\n")

    def _respond(self, code: int, message: str):
        self.send_response(code)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(message.encode())


def main():
    parser = argparse.ArgumentParser(
        description="HTTP file upload server — accepts curl uploads on port 80",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
curl examples:
  curl -F "file=@photo.jpg"          http://<ip>/upload
  curl --upload-file data.zip        http://<ip>/upload
  curl -X POST --data-binary @f.txt  http://<ip>/upload
        """
    )
    global UPLOAD_DIR
    parser.add_argument("--port", type=int, default=80,        help="Port to listen on (default: 80)")
    parser.add_argument("--dir",  default=UPLOAD_DIR,          help=f"Directory to save uploads (default: {UPLOAD_DIR})")
    args = parser.parse_args()

    if args.port < 1024 and os.geteuid() != 0:
        print("[!] Port 80 requires root. Run with sudo.")
        sys.exit(1)

    os.makedirs(args.dir, exist_ok=True)
    UPLOAD_DIR = args.dir

    print("=" * 60)
    print("  HTTP File Upload Server")
    print("=" * 60)
    print(f"  Listening : 0.0.0.0:{args.port}")
    print(f"  Save dir  : {os.path.abspath(args.dir)}")
    print(f"  Started   : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)
    print("  curl -F 'file=@yourfile' http://<this-ip>/upload")
    print("  curl --upload-file yourfile http://<this-ip>/upload")
    print("=" * 60)

    server = http.server.HTTPServer(("0.0.0.0", args.port), UploadHandler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n[!] Server stopped.")


if __name__ == "__main__":
    main()