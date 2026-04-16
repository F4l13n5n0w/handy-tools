#!/usr/bin/env python3
"""
TCP Port Listener - Listens on all TCP ports 1-65535
Must be run as root (required for ports < 1024)

Usage:
  sudo python3 tcp_port_listener.py
  sudo python3 tcp_port_listener.py --start 1 --end 65535
  sudo python3 tcp_port_listener.py --start 1024 --end 65535   # no root needed
"""

import socket
import threading
import argparse
import sys
import os
from datetime import datetime

open_ports = []
failed_ports = []
lock = threading.Lock()

def listen_on_port(port: int):
    """Bind and listen on a single TCP port."""
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(("0.0.0.0", port))
        sock.listen(5)
        with lock:
            open_ports.append(port)
        # Accept connections in a loop (non-blocking log)
        while True:
            try:
                conn, addr = sock.accept()
                timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                print(f"  [{timestamp}] Connection on port {port} from {addr[0]}:{addr[1]}")
                conn.close()
            except Exception:
                break
    except PermissionError:
        with lock:
            failed_ports.append((port, "Permission denied"))
    except OSError as e:
        with lock:
            failed_ports.append((port, str(e)))

def main():
    parser = argparse.ArgumentParser(
        description="Listen on all TCP ports 1-65535 (requires root for ports < 1024)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  sudo python3 tcp_port_listener.py
  sudo python3 tcp_port_listener.py --start 1 --end 1024
  python3 tcp_port_listener.py --start 1024 --end 65535
        """
    )
    parser.add_argument("--start", type=int, default=1,     help="Start port (default: 1)")
    parser.add_argument("--end",   type=int, default=65535, help="End port (default: 65535)")
    args = parser.parse_args()

    if args.start < 1024 and os.geteuid() != 0:
        print("[!] Ports below 1024 require root. Run with sudo, or use --start 1024.")
        sys.exit(1)

    total = args.end - args.start + 1
    print("=" * 60)
    print("  TCP Port Listener")
    print("=" * 60)
    print(f"  Range   : {args.start} - {args.end}  ({total:,} ports)")
    print(f"  Bind IP : 0.0.0.0  (all interfaces)")
    print(f"  Started : {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 60)
    print("  Binding ports... (this may take a moment)")

    threads = []
    for port in range(args.start, args.end + 1):
        t = threading.Thread(target=listen_on_port, args=(port,), daemon=True)
        t.start()
        threads.append(t)

    # Give threads time to bind
    import time
    time.sleep(3)

    print(f"  Successfully listening on : {len(open_ports):,} ports")
    print(f"  Failed to bind            : {len(failed_ports):,} ports")
    if failed_ports[:5]:
        for port, reason in failed_ports[:5]:
            print(f"    Port {port}: {reason}")
        if len(failed_ports) > 5:
            print(f"    ... and {len(failed_ports) - 5} more")
    print("=" * 60)
    print("  Listening for incoming connections. Press Ctrl+C to stop.")
    print("=" * 60)

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[!] Shutting down listener.")
        sys.exit(0)

if __name__ == "__main__":
    main()