#include <stdio.h>
#include "libtorrent/session.hpp"
#include "libtorrent/entry.hpp"
#include "libtorrent/bencode.hpp"
#include "libtorrent/session.hpp"

int startSimpleTask(char* torrent_path)
{
    using namespace libtorrent;
    
    session s;
    error_code ec;
    
    s.listen_on(std::make_pair(6881, 6889), ec);
    
    if (ec)
    {
        fprintf(stderr, "failed to open listen socket: %s\n", ec.message().c_str());
        return 1;
    }
    
    add_torrent_params p;
    p.save_path = "/sdcard/";
    
    p.ti = new torrent_info(torrent_path, ec);
    
    if (ec)
    {
        fprintf(stderr, "%s\n", ec.message().c_str());
        return 2;
    }
    
    s.add_torrent(p, ec);
    
    if (ec)
    {
        fprintf(stderr, "%s\n", ec.message().c_str());
        return 3;
    }
    
    return 0;
}
