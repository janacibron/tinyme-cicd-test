package main

# Policy: Require resource limits on containers
deny[msg] {
    input.kind == "Deployment"
    not input.spec.template.spec.containers[0].resources.limits
    msg := "Containers must have resource limits"
}

# Policy: Require health checks
deny[msg] {
    input.kind == "Deployment"
    not input.spec.template.spec.containers[0].readinessProbe
    msg := "Containers must have readiness probe"
}

# Policy: Deny latest tag
deny[msg] {
    input.kind == "Deployment"
    endswith(input.spec.template.spec.containers[0].image, ":latest")
    msg := "Container image must not use :latest tag"
}

# Policy: Require specific labels
deny[msg] {
    input.kind == "Deployment"
    not input.metadata.labels["app.kubernetes.io/name"]
    msg := "Deployment must have app.kubernetes.io/name label"
}
