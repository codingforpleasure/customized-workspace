<!--ts-->
   * [Wirehsark filter](#wirehsark-filter)
      * [Filter by IP](#filter-by-ip)
      * [Filter by Destination IP](#filter-by-destination-ip)
      * [Filter by Source IP](#filter-by-source-ip)
      * [Filter by IP Range](#filter-by-ip-range)
      * [Filter out/Exclude IP address](#filter-outexclude-ip-address)
      * [Filter IP subnet](#filter-ip-subnet)
      * [Filter by port](#filter-by-port)
      * [Filter by destination port (TCP)](#filter-by-destination-port-tcp)
      * [Filter by URL](#filter-by-url)
      * [Filter by ip address and port](#filter-by-ip-address-and-port)
      * [Filter SYN flag](#filter-syn-flag)
         * [Filter by broadcast](#filter-by-broadcast)
         * [RST flag filter](#rst-flag-filter)

<!-- Added by: gil_diy, at: 2020-07-01T12:28+03:00 -->

<!--te-->


# Wirehsark filter

## Filter by IP

```bash
ip.addr == 10.10.50.1
```

## Filter by Destination IP

```bash
ip.dest == 10.10.50.1
```

## Filter by Source IP

```bash
ip.src == 10.10.50.1
```

## Filter by IP Range

```bash
tcp.port == 25
```

## Filter out/Exclude IP address

```bash
!(ip.addr == 10.10.50.1)
```

## Filter IP subnet

```bash
ip.addr == 10.10.50.1/24
```

## Filter by port

```bash
tcp.port == 25
```

## Filter by destination port (TCP)

```bash
tcp.dstport == 23
```

## Filter by URL
```bash
http.host == “host name”
```

## Filter by ip address and port
```bash
ip.addr == 10.10.50.1 and Tcp.port == 25
```

## Filter SYN flag

```bash
tcp.flags.syn == 1
```

### Filter by broadcast 

```bash
eth.dst == ff:ff:ff:ff:ff:ff
```

### RST flag filter

```bash
tcp.flags.reset == 1
```