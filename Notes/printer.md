# HP OfficeJet (Ink) Printer Setup

Setup

```sh
# HP Ink printers require special drivers, eg. OfficeJet needs hplip
paru -Syu cups hplip
sudo systemctl enable --now cups
sudo hplip -i         # Follow through wizard
firefox localhost:631 # CUPS admin page
# Check that printer (setup in `hplip -i`) appears here
```

Print

```sh
lpstat -p # List printers

lp -d <printer> -- <file.pdf>

# Print double sided (portrait)
lp -d <printer> -o sides=two-sided-long-edge -- <file.pdf>
```

Stop a job

```sh
lprm -P <printer> - <job-id>
# The job id is outputted by the `lp` command when creating a printer job.
```
