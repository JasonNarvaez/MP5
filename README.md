# MP5
Creates a single event handler thread instead of multiple worker threads from MP4
Here we first fork off a process to load the dataserver, create three request channels threads, one event handler thread, and three stat threads. The event handler manages multiple request channels by using the select() call to monitor multiple file descriptors that have reccently been updated.

compile:
make

run:
client -n [number of data requests per person] -b [size of bounded buffer] -w [number of request channels to be handled by event handler thread]
