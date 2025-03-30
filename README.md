<div align="center">

  <div>
    <img height = "150" width = "150" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/oracle/oracle-original.svg" />
  </div>
          
</div>

<h1>Global Database Name (GDN)</h1>

<p style="text-align: justify;">O Global Database Name é o nome completo do banco de dados no Oracle. Ele segue o formato:</p>

```bash
<database_name>.<domain>
```

<p style="text-align: justify;">Se o nome do banco for MEUBANCO e o domínio for EXEMPLO.COM, então o GDN será:</p>

```bash
MEUBANCO.EXEMPLO.COM
```

<p style="text-align: justify;">Esse nome é importante porque permite identificar o banco de forma única dentro de uma rede corporativa.</p>

<h1>Oracle System Identifier (SID)</h1>

<p style="text-align: justify;">O SID (System Identifier) é um identificador único para a instância do banco de dados rodando no servidor.</p>

<p style="text-align: justify;">Se você tiver um banco chamado MEUBANCO, o SID pode ser simplesmente:</p>

```bash
MEUBANCO
```

<ul>

  <li style="text-align: justify;">O SID é usado, por exemplo, ao configurar um cliente Oracle para se conectar ao banco.</li>

  <li style="text-align: justify;">Ele não inclui o domínio, diferente do Global Database Name.</li>

</ul>

<h1>Pluggable Database Name (PDB Name)</h1>

<p style="text-align: justify;">O Pluggable Database Name refere-se ao nome de um banco de dados plugável dentro de um Container Database (CDB).</p>

<p style="text-align: justify;">Desde a versão Oracle 12c, o banco trabalha com a arquitetura Multitenant, onde um Container Database (CDB) pode conter vários Pluggable Databases (PDBs).</p>

<ul>

  <li style="text-align: justify;">Container Database (CDB): <b>CDB1</b></li>

  <li style="text-align: justify;">Pluggable Database (PDB): <b>PDB1, PDB2, PDB3</b></li>

</ul>

<p style="text-align: justify;">Ou seja, um único CDB pode conter vários bancos menores chamados PDBs, que funcionam como bancos independentes dentro do container.</p>

<table border="1">
    <tr>
        <th>Conceito</th>
        <th>Descrição</th>
        <th>Exemplo</th>
    </tr>
    <tr>
        <td>Global Database Name (GDN)</td>
        <td>Nome completo do banco na rede</td>
        <td>MEUBANCO.EXEMPLO.COM</td>
    </tr>
    <tr>
        <td>System Identifier (SID)</td>
        <td>Nome da instância do banco</td>
        <td>MEUBANCO</td>
    </tr>
    <tr>
        <td>Pluggable Database Name (PDB Name)</td>
        <td>Nome de um banco dentro de um CDB</td>
        <td>PDB1</td>
    </tr>
</table>