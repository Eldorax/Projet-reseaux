#include "iftun.h"
#include <stdio.h>
#include "extremite.h"
#include "init-from-file.h"
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>

int main(int argc, char ** argv)
{
	argc--;
	argv++;	

	//Information du fichier du configurattions.
	char * port_serveur_local;
	char * ip_serveur_distant;
	char * port_serveur_distant;
	char * interface_name;
	


	if(argc == 2)
	{
		char** args = calloc(MAX_ARGS*2, sizeof(char*));
		int i;

		for(i = 0; i < MAX_ARGS*2; i++)
			args[i] = calloc(MAX_LINE_LENGTH, sizeof(char));

		int len;
		len = parseFile(argv[0], &args);

		//On fait une rapide vérification du fichier.
		if( len < 4 )
		{
			printf("Fichier de configuration non valide\n");
			exit(1);
		}

		arg arguments = giveArgs(args, len);

		port_serveur_local   = arguments.port_serveur_local;
		ip_serveur_distant   = arguments.ip_serveur_distant;
		port_serveur_distant = arguments.port_serveur_distant;
		interface_name       = arguments.interface_name;
	}
	else if( argc == 5 )
	{
		port_serveur_local   = argv[3];
		ip_serveur_distant   = argv[1];
		port_serveur_distant = argv[2];
		interface_name       = argv[0];
	}
	else
	{
		printf("Mauvaise utilisation : \n");
		printf("tunnel.exe <nom interface> <serveur distant> <port distant> <port local> <fichier de configuration post tunnel>\n");
		printf("tunnel.exe <fichier de configuration>\n");
		exit(1);
	}


	int virtual_socket = tun_alloc( interface_name );
	int child;
	

	char param[70];
	if (argc == 2)
		sprintf(param, "ansible-playbook -c local %s", argv[1]);
	else
		sprintf(param, "ansible-playbook -c local %s", argv[4]);

	system( param );

	if ((child = fork()) != 0)
	{
		ext_out(port_serveur_local, virtual_socket);
		kill(child, SIGKILL);
	}
	else
	{
		sleep(1);
		ext_in (ip_serveur_distant, port_serveur_distant, virtual_socket);
	}

	return 0;
}
