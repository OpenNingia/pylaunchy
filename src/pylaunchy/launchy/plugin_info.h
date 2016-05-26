#ifndef PLUGIN_INFO_H
#define PLUGIN_INFO_H

#include <QPluginLoader>
#include <QHash>
#include "plugin_interface.h"
#include "catalog.h"

struct PluginInfo {
	uint id;
	QString name;
	QString path;
	PluginInterface* obj;
	bool loaded;
};

#endif // PLUGIN_INFO_H
