#!/bin/zsh

echo "************************************************************"
echo "* pok8s.rbac.yaml apply"
echo "************************************************************"
kubectl apply -f ./infra/pok8s/pok8s.rbac.yaml
echo -e "\n"

echo "************************************************************"
echo "* role 확인"
echo "************************************************************"
kubectl get role -n pok8s
echo -e "\n"

echo "************************************************************"
echo "* rolebinding 확인"
echo "************************************************************"
kubectl get rolebindings.rbac.authorization.k8s.io -n pok8s
echo -e "\n"

echo "************************************************************"
echo "* serviceaccount 확인"
echo "************************************************************"
kubectl get sa -n pok8s
echo -e "\n"

echo "************************************************************"
echo "* serviceaccount token 이 자동으로 생성되지 않는다는 것을 확인"
echo "************************************************************"
k describe sa pok8s-sa -n pok8s
echo -e "\n"

echo "************************************************************"
echo "* serviceaccount token 확인"
echo "************************************************************"
kubectl get secret pok8s-sa-secret -n pok8s -o yaml
echo -e "\n"

echo "************************************************************"
echo "* rolebinding 상세정보 확인"
echo "************************************************************"
kubectl describe rolebindings.rbac.authorization.k8s.io pok8s-namespace-full-access-rb -n pok8s
echo -e "\n"

echo "************************************************************"
echo "* k8s ca file 생성"
echo "************************************************************"
kubectl config view --minify --raw --output 'jsonpath={..cluster.certificate-authority-data}' | base64 -d > k8s-ca.cert
echo -e "\n"

SERVICE_ACCOUNT_TOKEN=$(kubectl get secret pok8s-sa-secret -n pok8s -o jsonpath={.data.token} | base64 -d)
CA_CERT_FILE="k8s-ca.cert"
API_SERVER="https://kubernetes.docker.internal:6443"
NAMESPACE_HELM="helm"
NAMESPACE_POK8S="pok8s"
RESOURCE_TYPE="pods"

echo "************************************************************"
echo "* helm namespace 접근"
echo "************************************************************"
curl --cacert $CA_CERT_FILE -H "Authorization: Bearer $SERVICE_ACCOUNT_TOKEN" "$API_SERVER/api/v1/namespaces/$NAMESPACE_HELM/$RESOURCE_TYPE"
echo -e "\n"

echo "************************************************************"
echo "* pok8s namespace 접근"
echo "************************************************************"
curl --cacert $CA_CERT_FILE -H "Authorization: Bearer $SERVICE_ACCOUNT_TOKEN" "$API_SERVER/api/v1/namespaces/$NAMESPACE_POK8S/$RESOURCE_TYPE"
echo -e "\n"