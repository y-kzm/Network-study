service {
    pppoe-server {
        authentication {
            local-users {
                username admin {
                    password P@ssw0rd
                }
            }
            mode local
        }
        client-ip-pool {
            start 192.168.12.100
            stop 192.168.12.199
        }
        dns-servers {
            server-1 192.168.12.1
        }
        interface net0
        local-ip 192.168.12.1
    }
}

/* Warning: Do not remove the following line. */
/* === vyatta-config-version: "broadcast-relay@1:cluster@1:config-management@1:conntrack@1:conntrack-sync@1:dhcp-relay@2:dhcp-server@5:firewall@5:ipsec@4:l2tp@1:mdns@1:nat@4:ntp@1:pptp@1:qos@1:quagga@3:ssh@1:system@9:vrrp@2:wanloadbalance@3:webgui@1:webproxy@2:zone-policy@1" === */
/* Release version: 1.2.0-rc11 */
