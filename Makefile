.PHONY: start kill develop

DIR="${PWD}"
HOST="blog.home"

develop:
	@gnome-terminal --tab-with-profile="tab"\
			--title="server"\
			--working-directory="${DIR}"\
			--command="make start"\
			--tab-with-profile="tab"\
			--title="terminal"\
			--working-directory="${DIR}"

start:
	jekyll serve --host ${HOST} --watch --unpublished --future

kill:
	kill `ps ax -o pid,cmd | grep jekyll | awk '{ print $1 }'`
