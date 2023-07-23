K8SENV=$(shell kubectl config current-context)

.PHONY: run-test
test-civo: kubestr
	@echo "Make sure $(K8SENV) is what you wish to test?  Press Enter to continue to Ctrl+C to abort"
	@read nothing
	./kubestr

kubestr:
	@curl -LO https://github.com/kastenhq/kubestr/releases/download/v0.4.34/kubestr_0.4.34_Linux_amd64.tar.gz
	@tar -xzf kubestr_0.4.34_Linux_amd64.tar.gz kubestr
	@rm kubestr_0.4.34_Linux_amd64.tar.gz
	@chmod 755 kubestr