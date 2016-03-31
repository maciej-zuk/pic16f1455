#!/usr/bin/python2
import sys
import serial
import time

s = serial.Serial('/dev/ttyACM0', 115200)
configurationWord1 = 0x3fff
configurationWord2 = 0x3f4f

def programFuse(value, offset):
	fuse = '%04X' % value
	s.write('8%s%i' % (fuse, offset))
	outFuse = s.read(4)
	print "Fused =", outFuse,
	if fuse == outFuse:
		print "OK"
	else:
		print "Error!"
	s.read(1)	


def printProgress(proc):
	so_far = "#"*int(proc*30)
	remain = " "*int(30-proc*30)
	print '\r['+so_far+remain+'] %.1f%%' % (proc*100),
	sys.stdout.flush()

def latchWord(data):
	s.write('3%04X' % data)
	s.read(1)

# load ihex
infile = open(sys.argv[1])
parsed = []
for line in infile:
	payload_size = int(line[1:3], 16)*2
	address = int(line[3:7], 16) / 2
	cmd = int(line[7:9], 16)
	payload = line[9:9+payload_size]
	payload_data = []
	for x in xrange(0, payload_size, 4):
		lnible = payload[x:x+2]
		hnible = payload[x+2:x+4]
		value = int(hnible+lnible, 16)
		payload_data.append(value)
	parsed.append([
		cmd, address, payload_data
	])

# some sane setup
print 'Dev info'
s.write('q')
s.read(1)
s.write('c')
print s.read(118)
s.read(1)
print 'Reset'
s.write('q')
s.read(1)
s.write('1')
s.read(1)
print 'Erase'
s.write('2')
s.read(1)

#programming phase
print 'Program'
current_address = 0
row = 0
maxrow = len(parsed)
verifyMem = []
for x in xrange(0x2000):
	verifyMem.append("3FFF")
for cmd, address, payload_data in parsed:	
	if cmd == 0:
		while current_address != address:
			current_address+=1		
			s.write('5')
			s.read(1)
		for data in payload_data[:-1]:
			verifyMem[current_address] = '%04X' % data
			latchWord(data)
			current_address+=1
			s.write('5')
			s.read(1)
		verifyMem[current_address] = '%04X' % payload_data[-1]
		latchWord(payload_data[-1])
		s.write('4')
		s.read(1)
		current_address+=1
		s.write('5')
		s.read(1)
	row+=1
	printProgress(float(row)/maxrow)
print "Done"

print "Read back"
s.write('q')
s.read(1)
s.write('1')
s.read(1)
s.write('6')
readMem = []
tmp = []
while True:
	d = s.read(1)
	if d=='>':
		break
	tmp.append(d)
	if len(tmp) == 4:
		readMem.append("".join(tmp))
		tmp = []

print 'Verify'
good = 0
for x in xrange(0x2000):
	if readMem[x] == verifyMem[x]:
		good+=1
print (0x2000-good), "Error(s)"
if good != 0x2000:
	print
	print readMem
	print
	print "Should be"
	print
	print verifyMem
	print


print "Fusing config word 1.",
programFuse(configurationWord1, 7)
print "Fusing config word 2.",
programFuse(configurationWord2, 8)
print "Exit prog"
s.write('7')
s.read(1)
s.close()
