provider "google" {
  project = "cris_iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/540829645030"
}

resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.ERP.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.ERP.name
}


resource "google_project" "cristiano_silva-Comercial-ERP-dev" {
  name       = "ERP-Dev"
  project_id = "cristiano_silva-Comercial-ERP-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"

}

resource "google_project" "cristiano_silva-Comercial-ERP-prod" {
  name       = "ERP-pro"
  project_id = "cristiano_silva-Comercial-ERP-prod"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"
}


resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/540829645030"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}


resource "google_project" "cristiano_silva-financeiro-SalesForce-dev" {
  name       = "SalesForce-Dev"
  project_id = "cristiano_silva-financeiro-SalesForce-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"

}

resource "google_project" "cristiano_silva-financeiro-SalesForce-prod" {
  name       = "SalesForce-Prod"
  project_id = "cristiano_silva-financeiro-SalesForce-dev"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"
}



resource "google_folder" "Logistica" {
  display_name = "Logistica"
  parent       = "organizations/540829645030"
}

resource "google_folder" "SAP" {
  display_name = "SAP"
  parent       = google_folder.Logistica.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.SAP.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SAP.name
}


resource "google_project" "cristiano_silva-logistica-SAP-dev" {
  name       = "SAP-Dev"
  project_id = "cristiano_silva-logistica-SAP-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"

}

resource "google_project" "cristiano_silva-logistica-SAP-prod" {
  name       = "SAP-Prod"
  project_id = "cristiano_silva-logistica-SAP-prod"
  folder_id  = google_folder.Producao.name
  auto_create_network=false
  billing_account = "0148EA-67F3D1-B9304E"
}