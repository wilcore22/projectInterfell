El proyecto cuenta con 3 carpetas,  en donde dos son de app y la restante es de la infraestructura.

las carpetas que contienen las app se les configuro un archivo de dockerfile para realizar la dockerización de la app.

la carpeta que contiene la infraestructura  esta diseñada con modulos para su facil configuración y despliegue



INFRAESTRUCTURA DEL PROYECTO

Se diseño una infraestructura autoescalable con HA, endonde se configuraron grupos de instancia de auto escaling, load balancer para la carga de trabajo y tambien se configuraron las redes en varias zonas.


Modulos usados en el proyecto


- module_aws_vpc: es la configuración de la red del proyecto
- module_aws_subnet_public: es la subred publica que tiene acceso a intenet todos los recursos que se asignen a estas subredes, adiocnal estan configuradas en varias zonas

- module_aws_subnet_public: es la subred privada que no tiene acceso a intenet a todos los recursos que se asignen a estas subredes, adiocnal estan configuradas en varias zonas

- module_aws_security_group: este modulo se configura las reglas de firewall de los recursos

- module_aws_route_subnet_public: En este modulo se configura el ruteo de las redes publicas hacia el nat gateway
- module_aws_rds: EL modulo esta diseñado para configurar una db en mysql 5.7

- module_aws_nat_gateway: este modulo esta diseñado para la salida de internet de la subred privada 

- module_aws_lb_private: el modulo es diseñado para que las mv que se configuren en el load balancer para el autoscaling se seten en este modulo

- module_aws_lb: modulo diseñado para las mv del autoescaling de la red publica se configuren en el.

- module_aws_ec2_autoescaling_private: este modulo es diseñado para que las mv que no esten expuestas en internet se configuren en el. En este modulo se configuro el autoescalamiento de las mv cuando el consumo de los recursos lleguen a un tope en especifico.


- module_aws_ec2_autoescaling_private: este modulo es diseñado para que las mv que esten expuestas en internet se configuren en el. En este modulo se configuro el autoescalamiento de las mv cuando el consumo de los recursos lleguen a un tope en especifico.


![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.](https://myoctocat.com/assets/images/base-octocat.svg)





