#include "Precompiled.h"
#include "ScriptPluginsSynchronizer.h"
#include <QMutex>

struct ScriptPluginsSynchronizer::PrivateImpl {
	QMutex dialogMutex;
	QMutex inPythonMutex;
};

ScriptPluginsSynchronizer::ScriptPluginsSynchronizer()
: m_pImpl(new PrivateImpl)
{
}

ScriptPluginsSynchronizer::~ScriptPluginsSynchronizer()
{
}

bool ScriptPluginsSynchronizer::tryLockInPythonMutex()
{
	return m_pImpl->inPythonMutex.tryLock();
}

void ScriptPluginsSynchronizer::unlockInPythonMutex()
{
    // since unlock fails with an assertion if the mutex is not locked
    // we make sure it is
    m_pImpl->inPythonMutex.tryLock(1);
	m_pImpl->inPythonMutex.unlock();
}

bool ScriptPluginsSynchronizer::tryLockDialogMutex()
{
	return m_pImpl->dialogMutex.tryLock();
}

void ScriptPluginsSynchronizer::unlockDialogMutex()
{
    // since unlock fails with an assertion if the mutex is not locked
    // we make sure it is
    m_pImpl->dialogMutex.tryLock(1);
	m_pImpl->dialogMutex.unlock();
}

void ScriptPluginsSynchronizer::enteringDoDialog()
{
	m_pImpl->dialogMutex.lock();
}

void ScriptPluginsSynchronizer::finishedEndDialog()
{
    // since unlock fails with an assertion if the mutex is not locked
    // we make sure it is
    m_pImpl->dialogMutex.tryLock(1);
	m_pImpl->dialogMutex.unlock();
}
