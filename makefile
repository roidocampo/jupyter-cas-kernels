
PYTHON=python
PREFIX=/usr/local
TARGET_DIR=${PREFIX}/share/jupyter
MODULE_BASEDIR=${PREFIX}/libexec/jupyter_cas_kernels

default:
	@echo make what?

user: install-kernels-user

install-kernels-user:
	${PYTHON} -m cas_kernels.kernelspecs.install

uninstall-kernels-user:
	${PYTHON} -m cas_kernels.kernelspecs.uninstall

install: install-module install-kernels-global

install-module:
	mkdir -p "${MODULE_BASEDIR}/"
	cp -r cas_kernels "${MODULE_BASEDIR}/"

install-kernels-global:
	${PYTHON} -m cas_kernels.kernelspecs.install "${TARGET_DIR}" "${MODULE_BASEDIR}"

link-sage-kernel:
	${PYTHON} -m cas_kernels.kernelspecs.link_sage "${TARGET_DIR}" "${MODULE_BASEDIR}"

uninstall: uninstall-module uninstall-kernels-global

uninstall-module:
	rm -r "${MODULE_BASEDIR}/cas_kernels "
	rmdir "${MODULE_BASEDIR}"

uninstall-kernels-global:
	${PYTHON} -m cas_kernels.kernelspecs.uninstall "${TARGET_DIR}"

