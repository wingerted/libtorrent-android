LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := libboost_system
LOCAL_SRC_FILES := boost/android/lib/libboost_system-gcc-mt-1_53.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libboost_filesystem
LOCAL_SRC_FILES := boost/android/lib/libboost_filesystem-gcc-mt-1_53.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libssl
LOCAL_SRC_FILES := libssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libcrypto
LOCAL_SRC_FILES := libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libtorrent

LOCAL_CFLAGS := -DBOOST_ASIO_HASH_MAP_BUCKETS=1021 \
				-DBOOST_FILESYSTEM_VERSION=3 \
				-DUNICODE \
				-DWITH_SHIPPED_GEOIP_H \
				-DTORRENT_BUILDING_SHARED \
				-DBOOST_ASIO_DYN_LINK \
				-DBOOST_ASIO_ENABLE_CANCELIO \
				-DTORRENT_USE_ICONV=0 \
				-DTORRENT_USE_TOMMATH
# -DBOOST_ASIO_SEPARATE_COMPILATION

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
					$(LOCAL_PATH)/boost \
					$(LOCAL_PATH)/openssl/include
					#$(LOCAL_PATH)/include/ed25519/src

LOCAL_SRC_FILES := ed25519/src/add_scalar.c \
					ed25519/src/fe.c \
					ed25519/src/ge.c \
					ed25519/src/key_exchange.c \
					ed25519/src/keypair.c \
					ed25519/src/sc.c \
					ed25519/src/sha512.c \
					ed25519/src/sign.c \
					ed25519/src/verify.c \
					src/simple_test.cpp \
					src/alert.cpp \
					src/asio_ssl.cpp \
					src/hasher.cpp \
					src/ip_voter.cpp \
					src/allocator.cpp \
					src/asio.cpp \
					src/assert.cpp \
					src/bandwidth_limit.cpp \
					src/bandwidth_manager.cpp \
					src/bandwidth_queue_entry.cpp \
					src/bloom_filter.cpp \
					src/broadcast_socket.cpp \
					src/bt_peer_connection.cpp \
					src/chained_buffer.cpp \
					src/connection_queue.cpp \
					src/create_torrent.cpp \
					src/ConvertUTF.cpp \
					src/disk_buffer_holder.cpp \
					src/disk_buffer_pool.cpp \
					src/disk_io_thread.cpp \
					src/entry.cpp \
					src/enum_net.cpp \
					src/error_code.cpp \
					src/escape_string.cpp \
					src/file.cpp \
					src/file_pool.cpp \
					src/file_storage.cpp \
					src/gzip.cpp \
					src/GeoIP.c \
					src/http_connection.cpp \
					src/http_parser.cpp \
					src/http_seed_connection.cpp \
					src/http_stream.cpp \
					src/http_tracker_connection.cpp \
					src/i2p_stream.cpp \
					src/identify_client.cpp \
					src/instantiate_connection.cpp \
					src/ip_filter.cpp \
					src/lazy_bdecode.cpp \
					src/logger.cpp \
					src/lsd.cpp \
					src/lt_trackers.cpp \
					src/magnet_uri.cpp \
					src/metadata_transfer.cpp \
					src/mpi.c \
					src/natpmp.cpp \
					src/packet_buffer.cpp \
					src/parse_url.cpp \
					src/pe_crypto.cpp \
					src/peer_connection.cpp \
					src/piece_picker.cpp \
					src/policy.cpp \
					src/puff.cpp \
					src/random.cpp \
					src/rsa.cpp \
					src/rss.cpp \
					src/session.cpp \
					src/session_impl.cpp \
					src/settings.cpp \
					src/sha1.cpp \
					src/smart_ban.cpp \
					src/socket_io.cpp \
					src/socket_type.cpp \
					src/socks5_stream.cpp \
					src/stat.cpp \
					src/storage.cpp \
					src/string_util.cpp \
					src/thread.cpp \
					src/time.cpp \
					src/timestamp_history.cpp \
					src/torrent.cpp \
					src/torrent_handle.cpp \
					src/torrent_info.cpp \
					src/tracker_manager.cpp \
					src/udp_socket.cpp \
					src/udp_tracker_connection.cpp \
					src/upnp.cpp \
					src/ut_metadata.cpp \
					src/ut_pex.cpp \
					src/utf8.cpp \
					src/utp_socket_manager.cpp \
					src/utp_stream.cpp \
					src/web_connection_base.cpp \
					src/web_peer_connection.cpp \
					src/xml_parse.cpp \
					src/alert_manager.cpp \
					src/kademlia/dht_tracker.cpp \
					src/kademlia/node.cpp \
					src/kademlia/refresh.cpp \
					src/kademlia/rpc_manager.cpp \
					src/kademlia/find_data.cpp \
					src/kademlia/node_id.cpp \
					src/kademlia/routing_table.cpp \
					src/kademlia/get_item.cpp \
					src/kademlia/get_peers.cpp \
					src/kademlia/item.cpp \
					src/kademlia/logging.cpp \
					src/kademlia/traversal_algorithm.cpp

LOCAL_STATIC_LIBRARIES := libboost_system \
						  libboost_filesystem \
							libssl \
							libcrypto

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
