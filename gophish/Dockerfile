FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl make nano git apt-utils && \
	GOLANG_LATEST_STABLE_VERSION=$(curl https://go.dev/dl/?mode=json | grep -o 'go.*.linux-amd64.tar.gz' | head -n 1 | tr -d '\r\n' ) && \
	cd /root && wget https://go.dev/dl/$GOLANG_LATEST_STABLE_VERSION && \
	rm -rf /usr/local/go && tar -C /usr/local -xzf $GOLANG_LATEST_STABLE_VERSION && \
	export PATH=$PATH:/usr/local/go/bin && \
	cd /root && go get github.com/gophish/gophish && \
	cd go/src/github.com/gophish/gophish && \
	sed -i 's/rid/id/g' models/campaign.go && sed -i 's/gophish//g' models/smtp_test.go && \
	sed -i 's/const\ ServerName\ =\ "gophish"/const\ ServerName\ =\ ""/g' config/config.go && \
	sed -i /'msg.SetHeader("X-Mailer",\ config.ServerName)'/d models/maillog.go && \
	sed -i /'msg.SetHeader("X-Mailer",\ config.ServerName)'/d models/email_request.go && \
	sed -i /'github.com\/gophish\/gophish\/config'/d models/maillog.go && \
	sed -i /'github.com\/gophish\/gophish\/config'/d models/email_request.go && \
	go build && \
	apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/* && \
	ln -s /root/go/src/github.com/gophish/gophish /opt/gophish

WORKDIR /opt/gophish
RUN sed -i 's/127.0.0.1/0.0.0.0/g' config.json && sed -i 's/false/true/g' config.json

CMD ["./gophish"]
