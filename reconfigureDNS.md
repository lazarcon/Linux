# Falls ```ping olymp``` nicht funktioniert:

```sudo dpgk-reconfigure resolvconf```
und anschliessend
```sudo systemctl restart system-resolved```
und zur Sicherheit
```sudo service network-manager restart```
