output "mysql_server" {
    value = module.database.mysql_server
    sensitive = true
}

output "mysql_database" {
    value = module.database.mysql_database
    sensitive = true
}

output "mysql_server_name" {
    value = module.database.mysql_server.name
}

output "mysql_database_name" {
    value = module.database.mysql_database.name
}

