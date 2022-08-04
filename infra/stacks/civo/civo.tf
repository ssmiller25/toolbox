

# Use size g4s.kube.large , hard coded (4CPU, 8GB RAM)

# Create a firewall
resource "civo_firewall" "toolbox-civo-firewall" {
    name = "toolbox-civo-firewall"
}

# Create a firewall rule
resource "civo_firewall_rule" "kubernetes" {
    firewall_id = civo_firewall.toolbox-civo-firewall.id
    protocol = "tcp"
    start_port = "6443"
    end_port = "6443"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "kubernetes-api-server"
    action = "allow"
}

# Create a cluster
resource "civo_kubernetes_cluster" "toolbox-civo-cluster" {
    name = "toolbox-civo"
    firewall_id = civo_firewall.toolbox-civo-firewall.id
    pools {
        label = "mainpool" // Optional
        size = "g4s.kube.large"
        node_count = 3
    }
}