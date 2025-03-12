env "docker" {
  src = "file://schema.sql"
  url = "postgres://postgres:postgres@postgres:5432?sslmode=disable"
  dev = "postgres://postgres:postgres@atlasdev:5432?sslmode=disable"
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}

env "host" {
  src = "file://schema.sql"
  url = "postgres://postgres:postgres@localhost:5432?sslmode=disable"
  dev = "postgres://postgres:postgres@localhost:5433?sslmode=disable"
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}