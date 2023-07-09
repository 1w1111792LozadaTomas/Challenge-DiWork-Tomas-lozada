using TallerMecanico.Models;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using System.Text.RegularExpressions;

namespace TallerMecanico.Datos
{
    public class MotocicletaDatos
    {
        public List<MotocicletaModel> Listar()
        {
            var oLista = new List<MotocicletaModel>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PROC_LISTAR_MOTOCICLETA", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            oLista.Add(new MotocicletaModel(
                                Convert.ToInt32(dr["IdMotocicleta"])!,
                                dr["Marca"].ToString()!,
                                dr["Modelo"].ToString()!,
                                Convert.ToInt32(dr["Anio"]),
                                Convert.ToString(dr["Patente"])!,
                                dr["Cilindrada"].ToString()!,
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

            return oLista;
        }

        public MotocicletaModel Obtener(int IdMotocicleta)
        {
            MotocicletaModel motocicleta = null;

            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_OBTENER_MOTOCICLETA", conexion);
                    cmd.Parameters.AddWithValue("@IdMotocicleta", IdMotocicleta);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            motocicleta = new MotocicletaModel(
                                Convert.ToInt32(dr["IdMotocicleta"])!,
                                dr["Marca"].ToString()!,
                                dr["Modelo"].ToString()!,
                                Convert.ToInt32(dr["Anio"]),
                                Convert.ToString(dr["Patente"])!,
                                dr["Cilindrada"].ToString()!,
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

            return motocicleta;
        }

        public string Agregar(MotocicletaModel motocicleta)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_AGREGAR_MOTOCICLETA", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Marca", motocicleta.Marca);
                    cmd.Parameters.AddWithValue("Modelo", motocicleta.Modelo);
                    cmd.Parameters.AddWithValue("Anio", motocicleta.Anio);
                    cmd.Parameters.AddWithValue("Patente", motocicleta.Patente);
                    cmd.Parameters.AddWithValue("Cilindrada", motocicleta.Cilindrada);

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

        public string Editar(MotocicletaModel motocicleta)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_EDITAR_MOTOCICLETA", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdMotocicleta", motocicleta.IdMotocicleta);
                    cmd.Parameters.AddWithValue("Marca", motocicleta.Marca);
                    cmd.Parameters.AddWithValue("Modelo", motocicleta.Modelo);
                    cmd.Parameters.AddWithValue("Anio", motocicleta.Anio);
                    cmd.Parameters.AddWithValue("Patente", motocicleta.Patente);
                    cmd.Parameters.AddWithValue("Cilindrada", motocicleta.Cilindrada);

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
        public string Eliminar(int? IdMotocicleta)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_BAJA_MOTOCICLETA", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdMotocicleta", IdMotocicleta);

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