# ------------------------ Install Script ------------------------
# This script configure all necessary components for the project.
# it is not good practice to use scripts like this in production
# but it does help to quickly set up a demo environment.
# ----------------------------------------------------------------

# Install Envoy as an API Gateway
kubectl apply --server-side -f https://github.com/envoyproxy/gateway/releases/download/v1.5.1/install.yaml


# Apply the other configurations
for file in *.yml *.yaml; do
  kubectl apply -f "$file"
done
