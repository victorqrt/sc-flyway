# Workaround

Append `sql/` entry to the jar:
```
zip -F sc-flyway.jar --out sc-flyway.zip
mkdir sql
zip -g sc-flyway.zip sql/
```
