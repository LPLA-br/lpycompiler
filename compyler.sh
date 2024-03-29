#!/bin/bash

# COMPILADOR PYTHON -> LPYTHON
# pequenas modificações sintáticas.

# class():
# function              def
# public function       def NOME
# protected function    def _NOME
# private function      def __NOME
# constructor           __init__
# else if               elif
# this                  self
# public this.          self.
# protected             _
# private               __
# linha_vazia           REMOVE
# comentário            REMOVE

NOVORQUIVO="$(echo $1 | sed -E 's/l//g')"

if [[ $1 == "" ]]; then
    echo "ERRO: Nenhum script lpython passado.";
else
    cat $1 |
    sed -E 's/.*\#.*//g' |
    sed -E '/^s*$/d' |
    sed -E 's/\+\+/+=1/g' |
    sed -E 's/\-\-/-=1/g' |
    sed -E 's/else +if/elif/g' |
    sed -E 's/constructor/__init__/g' |
    sed -E 's/public +function ?/def /g' |
    sed -E 's/private +function ?/def __/g' |
    sed -E 's/protected +function ?/def _/g' |
    sed -E 's/function/def /g' |
    sed -E 's/public +this/self/g' |
    sed -E 's/protected +this\./self._/g' |
    sed -E 's/private +this\./self.__/g' |
    sed -E 's/public //g' |
    sed -E 's/protected /_/g' |
    sed -E 's/private /__/g' |
    sed -E 's/this/self/g' > $NOVORQUIVO;
fi
