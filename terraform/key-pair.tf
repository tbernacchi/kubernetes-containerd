resource "aws_key_pair" "k3s-terraform" {
  key_name   = "k3s-terraform"
  public_key = file("/Users/tadeu/.ssh/k3s-terraform.pub")
}
