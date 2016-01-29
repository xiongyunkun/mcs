/* -*- mode: c++; c-basic-offset: 2; indent-tabs-mode: nil; -*-
 *  vim:expandtab:shiftwidth=2:tabstop=2:smarttab:
 *
 *  Copyright (C) 2009 Sun Microsystems, Inc.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; version 2 of the License.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef DRIZZLED_MODULE_LOAD_LIST_H
#define DRIZZLED_MODULE_LOAD_LIST_H

/* The list of builtin plugins */
#define PANDORA_BUILTIN_LIST "utility_functions,user_locks,transaction_log,table_cache_dictionary,string_functions,status_dictionary,sleep,signal_handler,show_dictionary,session_dictionary,schema_engine,schema_dictionary,replication_dictionary,registry_dictionary,protocol_dictionary,mysql_unix_socket_protocol,mysql_protocol,myisam,memory,math_functions,innobase,information_schema_dictionary,function_engine,error_dictionary,drizzle_protocol,console,collation_dictionary,catalog,auth_all"
#define PANDORA_BUILTIN_LOAD_LIST "utility_functions,user_locks,transaction_log,table_cache_dictionary,string_functions,status_dictionary,sleep,signal_handler,show_dictionary,session_dictionary,schema_engine,schema_dictionary,replication_dictionary,registry_dictionary,protocol_dictionary,mysql_unix_socket_protocol,mysql_protocol,myisam,memory,math_functions,innobase,information_schema_dictionary,function_engine,error_dictionary,drizzle_protocol,console,collation_dictionary,catalog,auth_all"
/* List of plugins that should be loaded on startup if no
 * value is given for --plugin-load */
#define PANDORA_PLUGIN_LIST "version,syslog,substr_functions,show_schema_proto,reverse_function,rand_function,multi_thread,logging_stats,length,hex_functions,errmsg_stderr,default_replicator,crc32,connection_id,compression,charlength,benchmark,ascii,"

/* The list of builtin plugins */
#define  PANDORA_BUILTIN_SYMBOLS_LIST _drizzled_utility_functions_plugin_,_drizzled_user_locks_plugin_,_drizzled_transaction_log_plugin_,_drizzled_table_cache_dictionary_plugin_,_drizzled_string_functions_plugin_,_drizzled_status_dictionary_plugin_,_drizzled_sleep_plugin_,_drizzled_signal_handler_plugin_,_drizzled_show_dictionary_plugin_,_drizzled_session_dictionary_plugin_,_drizzled_schema_engine_plugin_,_drizzled_schema_dictionary_plugin_,_drizzled_replication_dictionary_plugin_,_drizzled_registry_dictionary_plugin_,_drizzled_protocol_dictionary_plugin_,_drizzled_mysql_unix_socket_protocol_plugin_,_drizzled_mysql_protocol_plugin_,_drizzled_myisam_plugin_,_drizzled_memory_plugin_,_drizzled_math_functions_plugin_,_drizzled_innobase_plugin_,_drizzled_information_schema_dictionary_plugin_,_drizzled_function_engine_plugin_,_drizzled_error_dictionary_plugin_,_drizzled_drizzle_protocol_plugin_,_drizzled_console_plugin_,_drizzled_collation_dictionary_plugin_,_drizzled_catalog_plugin_,_drizzled_auth_all_plugin_
#define  PANDORA_BUILTIN_LOAD_SYMBOLS_LIST _drizzled_utility_functions_plugin_,_drizzled_user_locks_plugin_,_drizzled_transaction_log_plugin_,_drizzled_table_cache_dictionary_plugin_,_drizzled_string_functions_plugin_,_drizzled_status_dictionary_plugin_,_drizzled_sleep_plugin_,_drizzled_signal_handler_plugin_,_drizzled_show_dictionary_plugin_,_drizzled_session_dictionary_plugin_,_drizzled_schema_engine_plugin_,_drizzled_schema_dictionary_plugin_,_drizzled_replication_dictionary_plugin_,_drizzled_registry_dictionary_plugin_,_drizzled_protocol_dictionary_plugin_,_drizzled_mysql_unix_socket_protocol_plugin_,_drizzled_mysql_protocol_plugin_,_drizzled_myisam_plugin_,_drizzled_memory_plugin_,_drizzled_math_functions_plugin_,_drizzled_innobase_plugin_,_drizzled_information_schema_dictionary_plugin_,_drizzled_function_engine_plugin_,_drizzled_error_dictionary_plugin_,_drizzled_drizzle_protocol_plugin_,_drizzled_console_plugin_,_drizzled_collation_dictionary_plugin_,_drizzled_catalog_plugin_,_drizzled_auth_all_plugin_

#endif /* DRIZZLED_MODULE_LOAD_LIST_H */

