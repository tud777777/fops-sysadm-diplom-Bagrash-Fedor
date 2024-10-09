# Курсовая работа - Баграш Фёдор

## Технические особенности деплоя

### 1. Минимальная конфигурация виртуальных машин (ВМ):
- **Конфигурация ВМ:** 2 vCPU, 2 ГБ ОЗУ, 10 ГБ HDD, непрерываемая, гарантированная производительность ядер - 20%.
- **Операционная система:** Ubuntu 22.04.
- ВМ, работающие с данными (Elasticsearch), имеют увеличенный объём памяти до 4 ГБ.

### 2. Минимальная конфигурация каждой сети:
- **Компоненты сети:** NAT Gateway, Route Table.

### 3. Действия после выполнения деплоя ВМ bastion:
После деплоя ВМ `bastion`, вызывается набор провижнеров:
1. **Провижнер (remote-exec):** Создаёт директорию `ansible` и устанавливает Ansible.
2. **Провижнер (file):** Копирует приватный SSH-ключ.
3. **Провижнер (file):** Копирует файл `playbook.yaml` для Ansible.
4. **Провижнер (file):** Копирует файл `hosts` (инвентарь для Ansible).
5. **Провижнер (remote-exec):** Выдаёт права на приватный ключ.

### 4. Настройка после деплоя:
После завершения деплоя всех ресурсов с помощью Terraform, необходимо:
- Подключиться к ВМ `bastion`.
- Вписать IP-адреса всех ВМ в файл `hosts`.
- Запустить плейбук `playbook.yaml`.

### 5. Настройка ELK и создание дашбордов:
Настройка ELK и создание дашбордов в Grafana производится вручную.

## Технические особенности деплоя веб-серверов (Ansible)

1. Установка веб-сервера **NGINX** из стандартного репозитория.
2. Создание приветственной страницы.
3. Установка **Node Exporter** и **NGINX Log Exporter** для Prometheus.
4. Установка **Filebeat** с Яндекс-зеркала.

## Технические особенности деплоя Prometheus и Grafana (Ansible)

1. Установка **Prometheus** из GitHub-репозитория и настройка для подключения экспортёров.
2. Установка **Grafana** в Docker-контейнере, так как она недоступна в нашем регионе.
3. После установки необходимо зайти в Grafana и подключить Prometheus.

## Технические особенности деплоя ELK-стека

1. Установка **Filebeat**, **Elasticsearch** и **Kibana** с Яндекс-зеркала (также из-за их недоступности в нашем регионе).
2. Дальнейшая настройка выполняется через ВМ `bastion` отдельно для каждой машины.

## Результаты выполнения Terraform и Ansible

![]([img_terraform_result_1.png](https://tud777777/fops-sysadm-diplom-Bagrash-Fedor/blob/main/img/img2.png))
![](img_terraform_result_2.png)

## Работа балансировщика:

[http://84.252.132.85/](http://84.252.132.85/)

## Kibana:

[http://89.169.144.135:5601/app/dashboards#/view/046212a0-a2a1-11e7-928f-5dbe6f6f5519-ecs?_g=(filters:!(),refreshInterval:(pause:!t,value:5000),time:(from:now-15m,to:now))](http://89.169.144.135:5601/app/dashboards#/view/046212a0-a2a1-11e7-928f-5dbe6f6f5519-ecs?_g=(filters:!(),refreshInterval:(pause:!t,value:5000),time:(from:now-15m,to:now))

## Grafana:

[http://89.169.138.96:3000/d/ae0dcw9zdpo8we/nginx-servers?orgId=1](http://89.169.138.96:3000/d/ae0dcw9zdpo8we/nginx-servers?orgId=1)

