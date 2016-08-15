#!/usr/bin/env bash
# -*- coding: utf-8 -*-

[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

cd "${ROOT_DIR}"

pyenv versions | grep -q "${PYENV_NAME}"
response=$?

if [[ ! ${response} -eq '0' ]]; then
    pyenv virtualenv "${PYTHON_VERSION}" "${PYENV_NAME}" > /dev/null
fi