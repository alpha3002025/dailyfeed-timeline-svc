#!/bin/bash

# MySQL Port Forwarding Script for Dailyfeed
# This script sets up port forwarding from localhost:3306 to MySQL service in Kubernetes

echo "Setting up MySQL port forwarding..."

# Kill any existing port forwarding on port 3306
echo "Checking for existing port forwarding..."
if lsof -Pi :3306 -t >/dev/null 2>&1; then
    echo "Found existing process on port 3306, terminating..."
    kill $(lsof -Pi :3306 -t) 2>/dev/null
    sleep 2
fi

# Start port forwarding
echo "Starting port forwarding from localhost:3306 to mysql.infra.svc.cluster.local:3306..."
kubectl port-forward -n infra svc/mysql 3306:3306 &

# Get the PID of the port-forward process
PORT_FORWARD_PID=$!

# Wait a moment for the port forwarding to establish
sleep 2

# Check if port forwarding is running
if ps -p $PORT_FORWARD_PID > /dev/null; then
    echo ""
    echo "✅ Port forwarding established successfully!"
    echo ""
    echo "MySQL Connection Details:"
    echo "========================="
    echo "Host: localhost"
    echo "Port: 3306"
    echo "Username: dailyfeed"
    echo "Password: hitEnter@@@"
    echo "Database: dailyfeed"
    echo ""
    echo "Root access:"
    echo "Username: root"
    echo "Password: hitEnter@@@"
    echo ""
    echo "Process ID: $PORT_FORWARD_PID"
    echo "To stop port forwarding, run: kill $PORT_FORWARD_PID"
    echo ""
    echo "Press Ctrl+C to stop port forwarding..."
    
    # Keep the script running
    wait $PORT_FORWARD_PID
else
    echo "❌ Failed to establish port forwarding"
    exit 1
fi