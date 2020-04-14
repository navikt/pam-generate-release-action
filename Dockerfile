FROM ferrarimarco/github-changelog-generator:1.15.0

RUN apk add --no-cache bash curl jq sed

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
