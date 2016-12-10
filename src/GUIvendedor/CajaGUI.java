package GUIvendedor;


import Dao.cajaDao;
import To.cajaTo;
import java.sql.ResultSet;
import java.util.Calendar;

/**
 *
 * @author WANOSOFT
 */
public class CajaGUI extends javax.swing.JDialog {

    ResultSet rs, rs1, rs2;
    cajaDao cDao = new cajaDao();
    double entrada;
    double ventas;
    double compras;
    double reparaciones;
    double totalEfec;
    double ventasTotal;

    public CajaGUI(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(this);
        setResizable(false);
        calendario();
        calendario2();
        inicio();
        IniciarCuentas();

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        lblFecha = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtEntrada = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtVentas = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtReparaciones = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtCompras = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtTotal = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        txtVentadelDia = new javax.swing.JTextField();
        jPanel3 = new javax.swing.JPanel();
        lblFecha1 = new javax.swing.JLabel();
        btnFinalizar = new javax.swing.JButton();
        btnInciar = new javax.swing.JButton();
        btnImprimir = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Control de Efectivo - PAPSIS 2016");

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setText("Fecha:");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 40, -1, -1));

        jPanel2.setBackground(new java.awt.Color(0, 255, 204));

        jLabel2.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel2.setText("Control de Entrada y Salida de Efectivo");
        jLabel2.setAutoscrolls(true);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(63, 63, 63)
                .addComponent(jLabel2)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 510, -1));

        lblFecha.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblFecha.setText("dd/mm/aa");
        jPanel1.add(lblFecha, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 40, -1, -1));

        jLabel3.setText("Entrada:");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 83, -1, -1));

        txtEntrada.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(txtEntrada, new org.netbeans.lib.awtextra.AbsoluteConstraints(141, 80, 119, -1));

        jLabel4.setText("Ventas: ");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 124, -1, -1));

        txtVentas.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(txtVentas, new org.netbeans.lib.awtextra.AbsoluteConstraints(141, 121, 119, -1));

        jLabel5.setText("Reparaciones: ");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 153, -1, -1));

        txtReparaciones.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(txtReparaciones, new org.netbeans.lib.awtextra.AbsoluteConstraints(141, 150, 119, -1));

        jLabel6.setText("Compras: ");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 182, -1, -1));

        txtCompras.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(txtCompras, new org.netbeans.lib.awtextra.AbsoluteConstraints(141, 179, 119, -1));

        jLabel7.setText("Total Efectivo:");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(89, 232, -1, -1));

        txtTotal.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(txtTotal, new org.netbeans.lib.awtextra.AbsoluteConstraints(204, 229, 101, -1));

        jLabel8.setText("Venta del día:");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(89, 263, -1, -1));

        txtVentadelDia.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        txtVentadelDia.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtVentadelDiaActionPerformed(evt);
            }
        });
        jPanel1.add(txtVentadelDia, new org.netbeans.lib.awtextra.AbsoluteConstraints(204, 260, 101, -1));

        jPanel3.setBackground(new java.awt.Color(0, 255, 204));

        lblFecha1.setFont(new java.awt.Font("Tahoma", 1, 8)); // NOI18N
        lblFecha1.setText("dd/mm/aa");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblFecha1, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(371, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblFecha1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 19, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 327, 510, -1));

        btnFinalizar.setText("Finalizar");
        btnFinalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFinalizarActionPerformed(evt);
            }
        });
        jPanel1.add(btnFinalizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(355, 120, 108, -1));

        btnInciar.setText("Iniciar");
        btnInciar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInciarActionPerformed(evt);
            }
        });
        jPanel1.add(btnInciar, new org.netbeans.lib.awtextra.AbsoluteConstraints(355, 149, 108, -1));

        btnImprimir.setText("Imprimir");
        jPanel1.add(btnImprimir, new org.netbeans.lib.awtextra.AbsoluteConstraints(355, 178, 108, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnFinalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFinalizarActionPerformed
        try {
            cajaTo to = new cajaTo();
            to.setFecha(lblFecha.getText());
            to.setVentas(Double.parseDouble(txtVentas.getText()));
            to.setReparaciones(Double.parseDouble(txtReparaciones.getText()));
            to.setCompras(Double.parseDouble(txtCompras.getText()));
            to.setTotalEfectivo(Double.parseDouble(txtTotal.getText()));
            to.setTotalVentas(Double.parseDouble(txtVentadelDia.getText()));
            cDao.finalizarCaja(to);
            btnFinalizar.setEnabled(false);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        // un pequeño error  :P
    }//GEN-LAST:event_btnFinalizarActionPerformed

    private void btnInciarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInciarActionPerformed
        try {
            cajaTo to = new cajaTo();
            entrada = Double.parseDouble(txtEntrada.getText());
            ventas = 0.0;
            reparaciones = 0.0;
            compras = 0.0;
            totalEfec = 0.0;
            ventasTotal = 0.0;

            to.setFecha(lblFecha.getText());
            to.setEntrada(entrada);
            to.setVentas(ventas);
            to.setReparaciones(reparaciones);
            to.setCompras(compras);
            to.setTotalEfectivo(totalEfec);
            to.setTotalVentas(ventasTotal);
            if (entrada > 0) {
                cDao.insertar(to);
                btnInciar.setEnabled(false);
                txtEntrada.setEditable(false);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }//GEN-LAST:event_btnInciarActionPerformed

    private void txtVentadelDiaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtVentadelDiaActionPerformed
      
    }//GEN-LAST:event_txtVentadelDiaActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnFinalizar;
    private javax.swing.JButton btnImprimir;
    private javax.swing.JButton btnInciar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JLabel lblFecha;
    private javax.swing.JLabel lblFecha1;
    private javax.swing.JTextField txtCompras;
    private javax.swing.JTextField txtEntrada;
    private javax.swing.JTextField txtReparaciones;
    private javax.swing.JTextField txtTotal;
    private javax.swing.JTextField txtVentadelDia;
    private javax.swing.JTextField txtVentas;
    // End of variables declaration//GEN-END:variables
    private void IniciarCuentas() {
        try {
            ventas = 0;
            // captura las ventas del dia ***************************************
            rs = cDao.ventasFecha();
            while (rs.next()) {
                ventas = rs.getDouble(1);
                if (!rs.getString(2).equals(lblFecha1.getText())) {
                    txtVentas.setText("0.0");
                } else {
                    txtVentas.setText(String.valueOf(ventas));
                }
//                
            }

            // captura de reparaciones del dia *************************************
            rs1 = cDao.Reparaciones();
            while (rs1.next()) {
                reparaciones = rs1.getDouble(1);
                if (!rs1.getString(2).equals(lblFecha1.getText())) {
                    txtReparaciones.setText("0.0");
                } else {
                    txtReparaciones.setText(String.valueOf(reparaciones));
                }
            }

            // captura compras*******************************************************
            rs2 = cDao.Compras();
            while (rs2.next()) {
                compras = rs2.getDouble(1);
                if (!rs2.getString(2).equals(lblFecha.getText())) {
                    txtCompras.setText("0.0");
                } else {
                    txtCompras.setText(String.valueOf(compras));
                }
            }
            calculos();
        } catch (Exception e) {
            System.out.println(e);
        }

//           calculos();
    }

    private void calendario() {
        Calendar cal1 = Calendar.getInstance();
        String mesInt = "";
//********  AÑO   ********//
        int año = cal1.get(Calendar.YEAR);
        int añoAc = año - 2000;
//*********Mes*********//
        int mes = cal1.get(Calendar.MONTH);
        int mesActual = mes + 1;

        if (mesActual < 10) {
            mesInt = "/0" + mesActual;
        } else {
            mesInt = "/" + mesActual;
        }
//********Dia**********//
        int dia = cal1.get(Calendar.DAY_OF_YEAR);
        
        String diaInt = "";
        if (dia < 1 ) {
            diaInt = "/0" + dia;
        } else {
            diaInt = "/" + dia;
        }

        lblFecha.setText(""+ añoAc + mesInt + diaInt );

    }

    private void calendario2() {
        Calendar cal1 = Calendar.getInstance();
        String mesInt = "";
//********  AÑO   ********//
        int año = cal1.get(Calendar.YEAR);
        int añoAc = año - 2000;
//*********Mes*********//
        int mes = cal1.get(Calendar.MONTH);
        int mesActual = mes + 1;

        if (mesActual < 9) {
            mesInt = "0" + mesActual + "/";
        } else {
            mesInt = mesActual + "/";
        }
//********Dia**********//
        int dia = cal1.get(Calendar.DAY_OF_YEAR);
        String diaInt = "";
        if (dia < 10) {
            diaInt = "0" + dia + "/";
        } else {
            diaInt = dia + "/";
        }

        lblFecha1.setText("" + diaInt + mesInt + añoAc);

    }

    private void inicio() {
        try {
            cajaTo to = new cajaTo();
            to.setFecha(lblFecha.getText());
            rs = cDao.cajaView(to);
            while (rs.next()) {
                entrada = rs.getDouble(1);
            }
            if (entrada > 0) {
                txtEntrada.setText(String.valueOf(entrada));
            } 
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void calculos() {
        //calculos
        totalEfec = 0;
        ventasTotal = 0;
        totalEfec = entrada + ventas + reparaciones + compras;
        ventasTotal = totalEfec - entrada;
        txtTotal.setText(String.valueOf(totalEfec));
        txtVentadelDia.setText(String.valueOf(ventasTotal));

    }
}
