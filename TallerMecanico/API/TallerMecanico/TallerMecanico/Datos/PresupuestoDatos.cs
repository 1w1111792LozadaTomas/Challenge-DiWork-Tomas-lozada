using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TallerMecanico.Models;
using TallerMecanico.Models.DTOs;

namespace TallerMecanico.Datos
{
    public class PresupuestoDatos
    {
        public List<PresupuestoModel> Listar()
        {
            var presupuestos = new List<PresupuestoModel>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_LISTAR_PRESUPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            presupuestos.Add(new PresupuestoModel(
                                Convert.ToInt32(dr["IdPresupuesto"]),
                                dr["Nombre"].ToString(),
                                dr["Apellido"].ToString(),
                                dr["Email"].ToString(),
                                Convert.ToDecimal(dr["Total"]),
                                Convert.ToInt32(dr["IdVehiculo"]),
                                fechaBaja
                            ));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return presupuestos;
        }
        public List<VehiculoDto> LlenaComboVehiculos()
        {
            var oLista = new List<VehiculoDto>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            VehiculoDto vehiculo = new VehiculoDto();
                            vehiculo.IdVehiculo = Convert.ToInt32(dr["IdVehiculo"]);
                            vehiculo.Marca = dr["Marca"].ToString()!;
                            vehiculo.Modelo = dr["Modelo"].ToString()!;
                            vehiculo.Anio = Convert.ToInt32(dr["Anio"]);
                            vehiculo.Patente = Convert.ToString(dr["Patente"]);
                            oLista.Add(vehiculo);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oLista;
        }

        public List<VehiculoDto> LlenaComboVehiculosEditar()
        {
            var oLista = new List<VehiculoDto>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO_EDITAR", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            VehiculoDto vehiculo = new VehiculoDto();
                            vehiculo.IdVehiculo = Convert.ToInt32(dr["IdVehiculo"]);
                            vehiculo.Marca = dr["Marca"].ToString()!;
                            vehiculo.Modelo = dr["Modelo"].ToString()!;
                            vehiculo.Anio = Convert.ToInt32(dr["Anio"]);
                            vehiculo.Patente = Convert.ToString(dr["Patente"]);
                            oLista.Add(vehiculo);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oLista;
        }

        public PresupuestoModel Obtener(int idPresupuesto)
        {
            PresupuestoModel presupuesto = null;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_OBTENER_PRESUPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdPresupuesto", idPresupuesto);

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        if (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            presupuesto = new PresupuestoModel(
                                Convert.ToInt32(dr["IdPresupuesto"]),
                                dr["Nombre"].ToString(),
                                dr["Apellido"].ToString(),
                                dr["Email"].ToString(),
                                Convert.ToDecimal(dr["Total"]),
                                Convert.ToInt32(dr["IdVehiculo"]),
                                fechaBaja
                            );
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return presupuesto;
        }

        public string Agregar(PresupuestoModel presupuesto)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_AGREGAR_PRESUPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Nombre", presupuesto.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", presupuesto.Apellido);
                    cmd.Parameters.AddWithValue("@Email", presupuesto.Email);
                    cmd.Parameters.AddWithValue("@Total", presupuesto.Total);
                    cmd.Parameters.AddWithValue("@IdVehiculo", presupuesto.IdVehiculo);

                    SqlParameter msgParam = new SqlParameter("p_msg", SqlDbType.NVarChar, 100);
                    msgParam.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(msgParam);

                    cmd.ExecuteNonQuery();
                    string resultMsg = cmd.Parameters["p_msg"].Value.ToString();
                    return resultMsg;
                }
                catch (Exception ex)
                {
                    return "Error: " + ex.Message;
                }
                finally
                {
                    conexion.Close();
                }
            }
        }

        public string Editar(PresupuestoModel presupuesto)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_EDITAR_PRESUPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdPresupuesto", presupuesto.IdPresupuesto);
                    cmd.Parameters.AddWithValue("@Nombre", presupuesto.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", presupuesto.Apellido);
                    cmd.Parameters.AddWithValue("@Email", presupuesto.Email);
                    cmd.Parameters.AddWithValue("@Total", presupuesto.Total);
                    cmd.Parameters.AddWithValue("@IdVehiculo", presupuesto.IdVehiculo);

                    SqlParameter msgParam = new SqlParameter("p_msg", SqlDbType.NVarChar, 100);
                    msgParam.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(msgParam);

                    cmd.ExecuteNonQuery();

                    string resultMsg = cmd.Parameters["p_msg"].Value.ToString();
                    return resultMsg;
                }
                catch (Exception ex)
                {
                    return "Error: " + ex.Message;
                }
                finally
                {
                    conexion.Close();
                }
            }
        }

        public string Eliminar(int? IdPresupuesto)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_BAJA_PRESUPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdPresupuesto", IdPresupuesto);

                    SqlParameter msgParam = new SqlParameter("p_msg", SqlDbType.NVarChar, 100);
                    msgParam.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(msgParam);

                    cmd.ExecuteNonQuery();

                    string resultMsg = cmd.Parameters["p_msg"].Value.ToString();
                    return resultMsg;
                }
                catch (Exception ex)
                {
                    return "Error: " + ex.Message;
                }
                finally
                {
                    conexion.Close();
                }
            }
        }
    }
}