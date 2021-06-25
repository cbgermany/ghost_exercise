output "mysql_server" {
    value = module.database.mysql_server
    sensitive = true
}

output "mysql_database" {
    value = module.database.mysql_database
    sensitive = true
}