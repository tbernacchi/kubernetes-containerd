output "instance_ip_master" {
  description = "The public ip for ssh master"
  value       = "${aws_instance.master[*].public_ip}"
}

output "instance_ip_nodes" {
  description = "The public ip for ssh master"
  value       = "${aws_instance.nodes[*].public_ip}"
}
