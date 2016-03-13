.PHONY: start kill develop

DIR="${PWD}"
HOST="blog.home"

start:
	jekyll serve --host ${HOST} --watch --unpublished --future

develop:
	@gnome-terminal --tab-with-profile="tab"\
			--title="server"\
			--working-directory="${DIR}"\
			--command="make start"\
			--tab-with-profile="tab"\
			--title="terminal"\
			--working-directory="${DIR}"

kill:
	kill `ps ax -o pid,cmd | grep jekyll | awk '{ print $1 }'`
