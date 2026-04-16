#!/usr/bin/env python3
"""
Raw TCP HTTP File Downloader
Downloads a file from a server using raw TCP socket on port 80 (HTTP/1.1)

Usage:
  python3 raw_tcp_download.py <path> [--host <ip>] [--out <filename>]

Examples:
  python3 raw_tcp_download.py /index.html
  python3 raw_tcp_download.py /files/data.zip --out data.zip
  python3 raw_tcp_download.py /robots.txt --host 3.27.186.243
"""

import socket
import argparse
import sys
import os
from datetime import datetime

SERVER_IP   = "3.27.186.243"
SERVER_PORT = 80
BUFFER_SIZE = 4096


def download(host: str, port: int, path: str, out_file: str):
    print("=" * 60)
    print("  Raw TCP HTTP Downloader")
    print("=" * 60)
    print(f"  Server  : {host}:{port}")
    print(f"  Path    : {path}")
    print(f"  Output  : {out_file}")
    print(f"  Started : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)

    # Build a minimal HTTP/1.1 GET request
    request = (
        f"GET {path} HTTP/1.1\r\n"
        f"Host: {host}\r\n"
        f"User-Agent: raw-tcp-downloader/1.0\r\n"
        f"Connection: close\r\n"
        f"\r\n"
    )

    print(f"  [*] Connecting to {host}:{port} ...")
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.settimeout(10)
        sock.connect((host, port))
        print(f"  [+] Connected.")

        # Send HTTP GET request
        sock.sendall(request.encode())
        print(f"  [*] Request sent. Receiving response...")

        # Receive the full response
        raw_response = b""
        while True:
            try:
                chunk = sock.recv(BUFFER_SIZE)
                if not chunk:
                    break
                raw_response += chunk
            except socket.timeout:
                break

    # Split headers and body on the first blank line
    if b"\r\n\r\n" in raw_response:
        header_part, body = raw_response.split(b"\r\n\r\n", 1)
    elif b"\n\n" in raw_response:
        header_part, body = raw_response.split(b"\n\n", 1)
    else:
        print("  [!] Could not find header/body separator.")
        sys.exit(1)

    # Parse and display response headers
    headers_text = header_part.decode(errors="replace")
    header_lines = headers_text.split("\r\n") if "\r\n" in headers_text else headers_text.split("\n")
    status_line = header_lines[0]
    print(f"\n  HTTP Status : {status_line}")
    print("  Headers     :")
    for line in header_lines[1:]:
        if line.strip():
            print(f"    {line}")

    # Check for HTTP success
    if not status_line.startswith("HTTP/"):
        print("  [!] Unexpected response.")
        sys.exit(1)

    status_code = status_line.split(" ")[1] if len(status_line.split(" ")) > 1 else "???"
    if not status_code.startswith("2"):
        print(f"\n  [!] Server returned HTTP {status_code}. Nothing saved.")
        sys.exit(1)

    # Save body to file
    with open(out_file, "wb") as f:
        f.write(body)

    size_kb = len(body) / 1024
    print(f"\n  [+] Saved {len(body):,} bytes ({size_kb:.2f} KB) → {out_file}")
    print("=" * 60)


def main():
    parser = argparse.ArgumentParser(
        description="Download a file over raw TCP port 80 (HTTP GET)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 raw_tcp_download.py /index.html
  python3 raw_tcp_download.py /files/report.pdf --out report.pdf
  python3 raw_tcp_download.py /data.txt --host 3.27.186.243 --out data.txt
        """
    )
    parser.add_argument("path",          help="URL path to fetch, e.g. /index.html or /files/data.zip")
    parser.add_argument("--host",        default=SERVER_IP,   help=f"Server IP or hostname (default: {SERVER_IP})")
    parser.add_argument("--port",        default=SERVER_PORT, type=int, help="TCP port (default: 80)")
    parser.add_argument("--out",         default=None,        help="Output filename (default: basename of path)")
    args = parser.parse_args()

    # Default output filename to the basename of the path
    out_file = args.out or os.path.basename(args.path.rstrip("/")) or "downloaded_file"

    try:
        download(args.host, args.port, args.path, out_file)
    except ConnectionRefusedError:
        print(f"  [!] Connection refused on {args.host}:{args.port}")
        sys.exit(1)
    except socket.timeout:
        print(f"  [!] Connection timed out.")
        sys.exit(1)
    except KeyboardInterrupt:
        print("\n  [!] Interrupted.")
        sys.exit(0)


if __name__ == "__main__":
    main()