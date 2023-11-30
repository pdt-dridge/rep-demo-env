/* 
  CRUX-esq Nameset Definitions
*/

variable "namesets" {
  type    = map
  default = {
    # Generic/Default
    generic = {
      BS_1 = {
        name        = "Business Service 1"
        description = "Business Service 1: Description"
      }
      BS_2 = {
        name        = "Business Service 2"
        description = "Business Service 2: Description"
      }
      BS_3 = {
        name        = "Business Service 3"
        description = "Business Service 3: Description"
      }
      BS_4 = {
        name        = "Business Service 4"
        description = "Business Service 4: Description"
      }
      BS_5 = {
        name        = "Business Service 5"
        description = "Business Service 5: Description"
      }
      TS_1A         = "Technical Service 1A"
      TS_1B         = "Technical Service 1B"
      TS_1C         = "Technical Service 1C"
      TS_2A         = "Technical Service 2A"
      TS_2B         = "Technical Service 2B"
      TS_3          = "Technical Service 3"
      TS_4          = "Technical Service 4"
      TS_5          = "Technical Service 5"
    }

    # eCommerce
    ecommerce = {
      BS_1 = {
        name        = "Mobile App - Retail"
        description = "Completed Transactions ivia mobile channels"
      }
      BS_2 = {
        name        = "Self Service Potal"
        description = "Customer Self Service login and account management"
      }
      BS_3 = {
        name        = "My Account"
        description = "Customer Self Service login and account management"
      }
      BS_4 = {
        name        = "New Customer Sign Up"
        description = "NewBusiness Workflow"
      }
      BS_5 = {
        name        = "Customer Search"
        description = "Internal Customer Lookup"
      }
      TS_1A         = "Website Synthetics"
      TS_1B         = "Transaction Database"
      TS_1C         = "Customer Search"
      TS_2A         = "Product Catalog"
      TS_2B         = "NGINX"
      TS_3          = "Azure VMs"
      TS_4          = "AWS RDS"
      TS_5          = "Azure AD"    
    }

    # Retail Banking
    retail_banking = {
      BS_1 = {
        name        = "Online Banking"
        description = "Banking Platform supplying digital channels"
      }
      BS_2 = {
        name        = "Business Service 2"
        description = "Business Service 2: Description"
      }
      BS_3 = {
        name        = "Business Service 3"
        description = "Business Service 3: Description"
      }
      BS_4 = {
        name        = "Business Service 4"
        description = "Business Service 4: Description"
      }
      BS_5 = {
        name        = "Business Service 5"
        description = "Business Service 5: Description"
      }
      TS_1A         = "Payments API"
      TS_1B         = "Accounts Database"
      TS_1C         = "Technical Service 1C"
      TS_2A         = "Technical Service 2A"
      TS_2B         = "Technical Service 2B"
      TS_3          = "Technical Service 3"
      TS_4          = "Technical Service 4"
      TS_5          = "Technical Service 5"
    }    
  }
}

/* 
  Update local variable for given nameset to be applied
  e.g. terraform apply ... -var="NAMESET=ecommerce" wil apply eCommerce nameset to environment
*/
locals {
  nameset = {
    BS_1  = {
      name        = lookup(var.namesets, var.NAMESET).BS_1.name
      description = lookup(var.namesets, var.NAMESET).BS_1.description
    }
    BS_2  = {
      name        = lookup(var.namesets, var.NAMESET).BS_2.name
      description = lookup(var.namesets, var.NAMESET).BS_2.description
    }
    BS_2  = {
      name        = lookup(var.namesets, var.NAMESET).BS_2.name
      description = lookup(var.namesets, var.NAMESET).BS_2.description
    }
    BS_3  = {
      name        = lookup(var.namesets, var.NAMESET).BS_3.name
      description = lookup(var.namesets, var.NAMESET).BS_3.description
    }
    BS_4  = {
      name        = lookup(var.namesets, var.NAMESET).BS_4.name
      description = lookup(var.namesets, var.NAMESET).BS_4.description
    }
    BS_5  = {
      name        = lookup(var.namesets, var.NAMESET).BS_5.name
      description = lookup(var.namesets, var.NAMESET).BS_5.description
    }
    TS_1A         = lookup(var.namesets, var.NAMESET).TS_1A
    TS_1B         = lookup(var.namesets, var.NAMESET).TS_1B
    TS_1C         = lookup(var.namesets, var.NAMESET).TS_1C
    TS_2A         = lookup(var.namesets, var.NAMESET).TS_2A
    TS_2B         = lookup(var.namesets, var.NAMESET).TS_2B
    TS_3          = lookup(var.namesets, var.NAMESET).TS_3
    TS_4          = lookup(var.namesets, var.NAMESET).TS_4
    TS_5          = lookup(var.namesets, var.NAMESET).TS_5
  }
}