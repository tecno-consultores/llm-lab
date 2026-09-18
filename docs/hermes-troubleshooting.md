# hermes troubleshooting

* In the event that the Hermes web interface displays the message "could not safely reserve this session," you must run the following command inside the container and then restart it:

```bash
chmod -Rv 777 /opt/data/
```

* If Hermes does not read the SOUL.md file, ensure that it is located in the /opt/data/ directory with the name SOUL.md and then restart it.
