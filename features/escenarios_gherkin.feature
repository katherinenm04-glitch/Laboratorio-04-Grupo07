HU-01: Registro de nuevo cultivo
Feature: Gestión de cultivos
  Scenario: Registrar un nuevo cultivo con datos válidos (Positivo)
    Given que el agricultor tiene acceso al sistema[cite: 5]
    When registra un nuevo cultivo con nombre "Maíz", tipo "Cereales", fecha "15/09/2026" y área "2.5"[cite: 5]
    Then el sistema guarda el cultivo correctamente y muestra un mensaje de confirmación[cite: 5]
    And el nuevo cultivo se visualiza en la lista de cultivos[cite: 5]

  Scenario: Registrar cultivo con área inválida (Negativo)
    Given que el agricultor tiene acceso al sistema[cite: 5]
    When intenta registrar un cultivo con área "0"[cite: 5]
    Then el sistema muestra un mensaje de error indicando que el área debe ser mayor a 0[cite: 5]
    And no se guarda el cultivo[cite: 5]

HU-03: Registro de lotes de producción
Feature: Trazabilidad de lotes
  Scenario: Registro exitoso de lote (Positivo)
    Given que el responsable de producción está autenticado[cite: 5]
    When ingresa los datos completos del lote (producto, fecha de ingreso, cantidad y línea)[cite: 5]
    Then el sistema genera un código único para el lote y lo almacena con éxito[cite: 5]

HU-05: Modo de operación sin conexión (Offline)
Feature: Operación sin conectividad
  Scenario: Guardar operación localmente sin internet (Positivo)
    Given que el operador de campo se encuentra sin conexión a Internet[cite: 5]
    When registra una operación de entrada o salida de productos[cite: 5]
    Then el sistema almacena la operación localmente con estado "pendiente de sincronización"[cite: 5]
    And permite continuar operando con normalidad[cite: 5]

HU-06: Sincronización automática de datos
Feature: Sincronización de datos
  Scenario: Sincronización exitosa al recuperar red (Positivo)
    Given que existen registros almacenados localmente en modo offline[cite: 5, 6]
    When el dispositivo detecta nuevamente conexión a Internet[cite: 6]
    Then el sistema sincroniza automáticamente los registros pendientes sin duplicar información[cite: 6]

HU-07: Validación de política de privacidad
Feature: Protección de datos personales
  Scenario: Aceptación obligatoria de política de privacidad (Positivo)
    Given que el usuario va a registrar datos personales[cite: 6]
    When el sistema muestra la política de privacidad y el usuario hace clic en aceptar[cite: 6]
    Then se permite continuar con el registro[cite: 6]

HU-10: Restricción de salidas por falta de stock
Feature: Control de inventario y almacén
  Scenario: Bloqueo de salida por stock insuficiente (Negativo)
    Given que el encargado de almacén intenta despachar un pedido mayor al stock disponible[cite: 6]
    When confirma la salida de los productos[cite: 6]
    Then el sistema bloquea la operación y muestra una advertencia de stock insuficiente[cite: 6]
