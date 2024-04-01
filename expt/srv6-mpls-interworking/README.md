# `docker`: build docker image
```
$ cd docker
$ make 
```

# `mpls-mpls`: L3VPN(VPNv4) Inter-AS Option-B w/SR-MPLS
## topology
![](images/topo1.png)

## setup
```
$ tinet upconf -c mpls-mpls/spec.yaml | sudo sh -x
$ docker exec CE-1 ping 192.168.2.254 -c 3
```

# `mpls-srv6`: L3VPN(VPNv4) Inter-AS Option-B w/SR-MPLS SRv6 Interworking 
## topology
![](images/topo2.png)

## setup
- FRRへの追加実装前の問題点を確認する
```
$ tinet upconf -c mpls-srv6/spec1.yaml | sudo sh -x
$ docker exec PE-MPLS ip r s vrf USER-1
$ docker exec PE-SRv6 ip r s vrf USER-1
```

- ```iproute2```で直接データプレーンに設定を挿入して最終的な状態をイメージする
```
$ tinet upconf -c mpls-srv6/spec2.yaml | sudo sh -x
$ tinet test -c mpls-srv6/spec2.yaml iproute2 | sudo sh -x
$ docker exec CE-1 ping 192.168.2.254 -c 3
```

- FRRへの追加実装後の動作を確認する
  - ```neighbor <A.B.C.D|X:X::X:X|WORD> seg6-mpls-label-switching```
```
$ tinet upconf -c mpls-srv6/spec3.yaml | sudo sh -x
$ docker exec PE-MPLS ip r s vrf USER-1
$ docker exec PE-SRv6 ip r s vrf USER-1
$ docker exec CE-1 ping 192.168.2.254 -c 3
```
