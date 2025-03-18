env "docker" {
  src = "file://schema.sql"
  url = "postgres://myowner@postgres:5432/mydb?search_path=myschema&sslmode=disable"
  dev = "postgres://postgres:postgres@atlasdev:5432/mydb?search_path=myschema&sslmode=disable"
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}

env "host" {
  src = "file://schema.sql"
  url = "postgres://myowner@localhost:5432/mydb?search_path=myschema&sslmode=disable"
  dev = "postgres://postgres:postgres@localhost:5433/mydb?search_path=myschema&sslmode=disable"
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}