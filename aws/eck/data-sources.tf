data "terraform_remote_state" "k8s" {
  backend = "local"

  config = {
    path = "../eks/terraform.tfstate"
  }
}


data "kubectl_path_documents" "es" {
    pattern = "./eck-yamls/es.yaml"
    vars = {
        es_version = var.es_version
        eck_namespace = var.eck_namespace
        master_pod_ES_JAVA_OPTS = var.master_pod_ES_JAVA_OPTS
        hot_pod_ES_JAVA_OPTS = var.hot_pod_ES_JAVA_OPTS
        warm_pod_ES_JAVA_OPTS = var.warm_pod_ES_JAVA_OPTS
        cold_pod_ES_JAVA_OPTS = var.cold_pod_ES_JAVA_OPTS
        frozen_pod_ES_JAVA_OPTS = var.frozen_pod_ES_JAVA_OPTS
        ml_pod_ES_JAVA_OPTS = var.ml_pod_ES_JAVA_OPTS
        master_pod_roles = var.master_pod_roles
        hot_pod_roles = var.hot_pod_roles
        warm_pod_roles = var.warm_pod_roles
        cold_pod_roles = var.cold_pod_roles
        frozen_pod_roles = var.frozen_pod_roles
        ml_pod_roles = var.ml_pod_roles
        master_pod_cpu = var.master_pod_cpu
        hot_pod_cpu = var.hot_pod_cpu
        warm_pod_cpu = var.warm_pod_cpu
        cold_pod_cpu = var.cold_pod_cpu
        frozen_pod_cpu = var.frozen_pod_cpu
        ml_pod_cpu = var.ml_pod_cpu
        master_pod_memory = var.master_pod_memory
        hot_pod_memory = var.hot_pod_memory
        warm_pod_memory = var.warm_pod_memory
        cold_pod_memory = var.cold_pod_memory
        frozen_pod_memory = var.frozen_pod_memory
        ml_pod_memory = var.ml_pod_memory
        master_pod_count = var.master_pod_count
        hot_pod_count = var.hot_pod_count
        warm_pod_count = var.warm_pod_count
        cold_pod_count = var.cold_pod_count
        frozen_pod_count = var.frozen_pod_count
        ml_pod_count = var.ml_pod_count
        master_pod_storage = var.master_pod_storage
        hot_pod_storage = var.hot_pod_storage
        warm_pod_storage = var.warm_pod_storage
        cold_pod_storage = var.cold_pod_storage
        frozen_pod_storage = var.frozen_pod_storage
        ml_pod_storage = var.ml_pod_storage
        master_accept_ingest = var.master_accept_ingest
        hot_accept_ingest = var.hot_accept_ingest
        warm_accept_ingest = var.warm_accept_ingest
        cold_accept_ingest = var.cold_accept_ingest
        frozen_accept_ingest = var.frozen_accept_ingest
        ml_accept_ingest = var.ml_accept_ingest
        master_pod_storage_class_name = var.master_pod_storage_class_name
        hot_pod_storage_class_name = var.hot_pod_storage_class_name
        warm_pod_storage_class_name = var.warm_pod_storage_class_name
        cold_pod_storage_class_name = var.cold_pod_storage_class_name
        frozen_pod_storage_class_name = var.frozen_pod_storage_class_name
        ml_pod_storage_class_name = var.ml_pod_storage_class_name
    }
}


data "kubectl_path_documents" "es-count" {
  pattern = "./eck-yamls/es.yaml"
  vars = {
        es_version = ""
        eck_namespace = ""
        master_pod_ES_JAVA_OPTS = ""
        hot_pod_ES_JAVA_OPTS = ""
        warm_pod_ES_JAVA_OPTS = ""
        cold_pod_ES_JAVA_OPTS = ""
        frozen_pod_ES_JAVA_OPTS = ""
        ml_pod_ES_JAVA_OPTS = ""
        master_pod_roles = ""
        hot_pod_roles = ""
        warm_pod_roles = ""
        cold_pod_roles = ""
        frozen_pod_roles = ""
        ml_pod_roles = ""
        master_pod_cpu = ""
        hot_pod_cpu = ""
        warm_pod_cpu = ""
        cold_pod_cpu = ""
        frozen_pod_cpu = ""
        ml_pod_cpu = ""
        master_pod_memory = ""
        hot_pod_memory = ""
        warm_pod_memory = ""
        cold_pod_memory = ""
        frozen_pod_memory = ""
        ml_pod_memory = ""
        master_pod_count = ""
        hot_pod_count = ""
        warm_pod_count = ""
        cold_pod_count = ""
        frozen_pod_count = ""
        ml_pod_count = ""
        master_pod_storage = ""
        hot_pod_storage = ""
        warm_pod_storage = ""
        cold_pod_storage = ""
        frozen_pod_storage = ""
        ml_pod_storage = ""
        master_accept_ingest = ""
        hot_accept_ingest = ""
        warm_accept_ingest = ""
        cold_accept_ingest = ""
        frozen_accept_ingest =""
        ml_accept_ingest = ""
        master_pod_storage_class_name = ""
        hot_pod_storage_class_name = ""
        warm_pod_storage_class_name = ""
        cold_pod_storage_class_name = ""
        frozen_pod_storage_class_name =""
        ml_pod_storage_class_name = ""
  }
}


data "kubectl_path_documents" "kibana" {
    pattern = "./eck-yamls/kibana.yaml"
    vars = {
        es_version = var.es_version
        eck_namespace = var.eck_namespace
        kibana_pod_memory = var.kibana_pod_memory
        kibana_pod_cpu = var.kibana_pod_cpu
        kibana_pod_count = var.kibana_pod_count
    }
}


data "kubectl_path_documents" "kibana-count" {
    pattern = "./eck-yamls/kibana.yaml"
    vars = {
        es_version = ""
        eck_namespace = ""
        kibana_pod_memory = ""
        kibana_pod_cpu = ""
        kibana_pod_count = ""
    }
}

data "kubectl_path_documents" "gp3" {
    pattern = "./eck-yamls/gp3-sc.yaml"
}


data "kubectl_path_documents" "gp3-count" {
    pattern = "./eck-yamls/gp3-sc.yaml"
}

data "kubectl_path_documents" "master-sc" {
    pattern = "./eck-yamls/master-sc.yaml"
    vars = {
        master_pod_storage_class_name = var.master_pod_storage_class_name
        master_pod_storage_class = var.master_pod_storage_class
        master_pod_storage_class_iops = var.master_pod_storage_class_iops
        master_pod_storage_class_throughput = var.master_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "master-sc-count" {
    pattern = "./eck-yamls/master-sc.yaml"
    vars = {
        master_pod_storage_class_name = ""
        master_pod_storage_class = ""
        master_pod_storage_class_iops = ""
        master_pod_storage_class_throughput = ""
    }
}

data "kubectl_path_documents" "hot-sc" {
    pattern = "./eck-yamls/hot-sc.yaml"
    vars = {
        hot_pod_storage_class_name = var.hot_pod_storage_class_name
        hot_pod_storage_class = var.hot_pod_storage_class
        hot_pod_storage_class_iops = var.hot_pod_storage_class_iops
        hot_pod_storage_class_throughput = var.hot_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "hot-sc-count" {
    pattern = "./eck-yamls/hot-sc.yaml"
    vars = {
        hot_pod_storage_class_name = ""
        hot_pod_storage_class = ""
        hot_pod_storage_class_iops = ""
        hot_pod_storage_class_throughput = ""
    }
}


data "kubectl_path_documents" "warm-sc" {
    pattern = "./eck-yamls/warm-sc.yaml"
    vars = {
        warm_pod_storage_class_name = var.warm_pod_storage_class_name
        warm_pod_storage_class = var.warm_pod_storage_class
        warm_pod_storage_class_iops = var.warm_pod_storage_class_iops
        warm_pod_storage_class_throughput = var.warm_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "warm-sc-count" {
    pattern = "./eck-yamls/warm-sc.yaml"
    vars = {
        warm_pod_storage_class_name = ""
        warm_pod_storage_class = ""
        warm_pod_storage_class_iops = ""
        warm_pod_storage_class_throughput = ""
    }
}

data "kubectl_path_documents" "cold-sc" {
    pattern = "./eck-yamls/cold-sc.yaml"
    vars = {
        cold_pod_storage_class_name = var.cold_pod_storage_class_name
        cold_pod_storage_class = var.cold_pod_storage_class
        cold_pod_storage_class_iops = var.cold_pod_storage_class_iops
        cold_pod_storage_class_throughput = var.cold_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "cold-sc-count" {
    pattern = "./eck-yamls/cold-sc.yaml"
    vars = {
        cold_pod_storage_class_name = ""
        cold_pod_storage_class = ""
        cold_pod_storage_class_iops = ""
        cold_pod_storage_class_throughput = ""
    }
}

data "kubectl_path_documents" "frozen-sc" {
    pattern = "./eck-yamls/frozen-sc.yaml"
    vars = {
        frozen_pod_storage_class_name = var.frozen_pod_storage_class_name
        frozen_pod_storage_class = var.frozen_pod_storage_class
        frozen_pod_storage_class_iops = var.frozen_pod_storage_class_iops
        frozen_pod_storage_class_throughput = var.frozen_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "frozen-sc-count" {
    pattern = "./eck-yamls/frozen-sc.yaml"
    vars = {
        frozen_pod_storage_class_name = ""
        frozen_pod_storage_class = ""
        frozen_pod_storage_class_iops = ""
        frozen_pod_storage_class_throughput = ""
    }
}

data "kubectl_path_documents" "ml-sc" {
    pattern = "./eck-yamls/ml-sc.yaml"
    vars = {
        ml_pod_storage_class_name = var.ml_pod_storage_class_name
        ml_pod_storage_class = var.ml_pod_storage_class
        ml_pod_storage_class_iops = var.ml_pod_storage_class_iops
        ml_pod_storage_class_throughput = var.ml_pod_storage_class_throughput
    }
}


data "kubectl_path_documents" "ml-sc-count" {
    pattern = "./eck-yamls/ml-sc.yaml"
    vars = {
        ml_pod_storage_class_name = ""
        ml_pod_storage_class = ""
        ml_pod_storage_class_iops = ""
        ml_pod_storage_class_throughput = ""
    }
}

data "kubectl_path_documents" "loadbalancer" {
    pattern = "./eck-yamls/loadbalancer.yaml"
    vars = {
        eck_namespace = var.eck_namespace
    }
}



data "kubectl_path_documents" "loadbalancer-count" {
    pattern = "./eck-yamls/loadbalancer.yaml"
    vars = {
        eck_namespace = ""
    }
}



data "kubectl_path_documents" "aws-secrets" {
    pattern = "./eck-yamls/secrets.yaml"
    vars = {
        aws_access_key = var.aws_access_key
        aws_secret_key= var.aws_secret_key
    }
}

