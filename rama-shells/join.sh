#!/usr/bin/env bash
kubeadm join 192.168.57.3:6443 --token vifohf.kv7h0h5vkvwz06mk \
	--discovery-token-ca-cert-hash sha256:f5fe99bc28b0516325ee36b95ff925ecbf78276b7104b2ec8a75bb749799480e 
