from p4utils.mininetlib.network_API import NetworkAPI

net = NetworkAPI()

# Network general options
net.setLogLevel('info')
net.enableCli()


net.addP4Switch('s0', cli_input='commands/commands_0.txt')
net.setP4Source('s0', 'p4src/s0.p4')
net.addP4Switch('s1_0', cli_input='commands/commands_1_0.txt')
net.setP4Source('s1_0', 'p4src/s1_0.p4')
net.addP4Switch('s1_1', cli_input='commands/commands_1_1.txt')
net.setP4Source('s1_1', 'p4src/s1_1.p4')
net.addP4Switch('s2', cli_input='commands/commands_2.txt')
net.setP4Source('s2', 'p4src/s2.p4')
net.addP4Switch('s3', cli_input='commands/commands_3.txt')
net.setP4Source('s3', 'p4src/s3.p4')
net.addP4Switch('s7', cli_input='commands/commands_7.txt')
net.setP4Source('s7', 'p4src/s7.p4')
net.addHost('h1')
net.addHost('h2')
net.addLink('h1', 's0')
net.addLink('s0', 's1_0')
net.addLink('s0', 's1_1')
net.addLink('s1_0','s2')
net.addLink('s1_1','s2')
net.addLink('s2', 's3')
net.addLink('s3', 's7')
net.addLink('s7', 'h2')


net.mixed()
net.enablePcapDumpAll()
net.enableLogAll()
net.startNetwork()