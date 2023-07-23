

# Use size g4s.kube.large , hard coded (4CPU, 8GB RAM)

# Create a firewall
resource "civo_firewall" "diskbench-firewall" {
    name = "diskbench-firewall"
}

# Create a firewall rule
resource "civo_firewall_rule" "kubernetes" {
    firewall_id = civo_firewall.diskbench-firewall.id
    protocol = "tcp"
    start_port = "6443"
    end_port = "6443"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "kubernetes-api-server"
    action = "allow"
}

# Create a cluster
resource "civo_kubernetes_cluster" "diskbench-cluster" {
    name = "diskbench"
    firewall_id = civo_firewall.diskbench-firewall.id
    pools {
        label = "mainpool" // Optional
        size = "g4s.kube.large"
        node_count = 3
    }
}