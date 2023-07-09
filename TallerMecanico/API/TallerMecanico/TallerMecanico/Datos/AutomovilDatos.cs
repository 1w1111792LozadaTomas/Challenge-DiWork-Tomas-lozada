using TallerMecanico.Models;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using System.Text.RegularExpressions;

namespace TallerMecanico.Datos
{
    public class AutomovilDatos
    {
        public List<AutomovilModel> Listar()
        {
            var oLista = new List<AutomovilModel>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PROC_LISTAR_AUTOMOVIL", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            oLista.Add(new AutomovilModel(
                            Convert.ToInt32(dr["IdAutomovil"]),
                            dr["Marca"].ToString()!,
                            dr["Modelo"].ToString()!,
                            Convert.ToInt32(dr["Anio"]),
                            Convert.ToString(dr["Patente"])!,
                            (AutomovilModel.Tipo)Enum.Parse(typeof(AutomovilModel.Tipo), dr["Tipo"].ToString()),
                            Convert.ToInt32(dr["Puertas"]),
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

        public AutomovilModel Obtener(int IdAutomovil)
        {
            AutomovilModel automovil = null;

            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_OBTENER_AUTOMOVIL", conexion);
                    cmd.Parameters.AddWithValue("@IdAutomovil", IdAutomovil);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var dr = cmd.ExecuteReader())
                    {
                        DateTime? fechaBaja = null;
                        while (dr.Read())
                        {
                            fechaBaja = null;
                            if (!DBNull.Value.Equals(dr["FechaBaja"]))
                                fechaBaja = Convert.ToDateTime(dr["FechaBaja"]);
                            automovil = new AutomovilModel(Convert.ToInt32(dr["IdAutomovil"]), dr["Marca"].ToString()!, dr["Modelo"].ToString()!, Convert.ToInt32(dr["Anio"]), Convert.ToString(dr["Patente"])!, (AutomovilModel.Tipo)Enum.Parse(typeof(AutomovilModel.Tipo), dr["Tipo"].ToString()), Convert.ToInt32(dr["Puertas"]), fechaBaja);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return automovil;
        }

        public string Agregar(AutomovilModel automovil)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_AGREGAR_AUTOMOVIL", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Marca", automovil.Marca);
                    cmd.Parameters.AddWithValue("Modelo", automovil.Modelo);
                    cmd.Parameters.AddWithValue("Anio", automovil.Anio);
                    cmd.Parameters.AddWithValue("Patente", automovil.Patente);
                    cmd.Parameters.AddWithValue("Puertas", automovil.Puertas);
                    cmd.Parameters.AddWithValue("Tipo", automovil.SelectedTipo);

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

        public string Editar(AutomovilModel automovil)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_EDITAR_AUTOMOVIL", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdAutomovil", automovil.IdAutomovil);
                    cmd.Parameters.AddWithValue("Marca", automovil.Marca);
                    cmd.Parameters.AddWithValue("Modelo", automovil.Modelo);
                    cmd.Parameters.AddWithValue("Anio", automovil.Anio);
                    cmd.Parameters.AddWithValue("Patente", automovil.Patente);
                    cmd.Parameters.AddWithValue("Tipo", automovil.SelectedTipo);
                    cmd.Parameters.AddWithValue("Puertas", automovil.Puertas);

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

        public string Eliminar(int? IdAutomovil)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_BAJA_AUTOMOVIL", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdAutomovil", IdAutomovil);

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
