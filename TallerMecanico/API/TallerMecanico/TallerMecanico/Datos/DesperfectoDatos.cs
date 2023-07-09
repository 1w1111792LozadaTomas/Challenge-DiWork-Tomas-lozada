using TallerMecanico.Models;
using System.Data.SqlClient;
using System.Data;
using System.Reflection;
using System.Text.RegularExpressions;
using TallerMecanico.Models.DTOs;

namespace TallerMecanico.Datos
{
    public class DesperfectoDatos
    {
        public List<DesperfectoModel> Listar(int idPresupuesto)
        {
            var oLista = new List<DesperfectoModel>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_LISTAR_DESPERFECTO", conexion);
                    cmd.Parameters.AddWithValue("@IdPresupuesto", idPresupuesto);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        oLista.Add(new DesperfectoModel(null, idPresupuesto, null, null, null, null));
                        while (dr.Read())
                        {
                            oLista.Add(new DesperfectoModel(
                                Convert.ToInt32(dr["IdDesperfecto"]),
                                Convert.ToInt32(dr["IdPresupuesto"]),
                                dr["Descripcion"].ToString(),
                                Convert.ToDecimal(dr["ManoDeObra"]),
                                Convert.ToDouble(dr["Tiempo"])
                                , null
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

        public List<RepuestoModel> LlenaComboRepuestos()
        {
            var oLista = new List<RepuestoModel>();

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_LISTAR_REPUESTOS", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oLista.Add(new RepuestoModel(
                                Convert.ToInt32(dr["IdRepuesto"]),
                                Convert.ToString(dr["Nombre"]),
                                Convert.ToDouble(dr["Precio"])
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

        public DesperfectoModel Obtener(int IdDesperfecto)
        {
            DesperfectoModel desperfecto = null;

            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_OBTENER_DESPERFECTO", conexion);
                    cmd.Parameters.AddWithValue("@IdDesperfecto", IdDesperfecto);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            desperfecto = new DesperfectoModel(
                                Convert.ToInt32(dr["IdDesperfecto"]),
                                Convert.ToInt32(dr["IdPresupuesto"]),
                                dr["Descripcion"].ToString(),
                                Convert.ToDecimal(dr["ManoDeObra"]),
                                Convert.ToDouble(dr["Tiempo"]),
                                null
                            );
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return desperfecto;
        }

        public List<DetalleDesperfectoDTO> ObtenerDetalle(int IdDesperfecto)
        {
            var oLista = new List<DetalleDesperfectoDTO>();

            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_DESPERFECTO_DETALLE", conexion);
                    cmd.Parameters.AddWithValue("@IdDesperfecto", IdDesperfecto);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oLista.Add(new DetalleDesperfectoDTO(
                                Convert.ToInt32(dr["idPresupuesto"]),
                                Convert.ToString(dr["Nombre"]),
                                Convert.ToDouble(dr["Precio"]),
                                Convert.ToInt32(dr["Cantidad"]),
                                Convert.ToDouble(dr["Subtotal"])));
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

        public string Agregar(DesperfectoModel desperfecto)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_AGREGAR_DESPERFECTO", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdPresupuesto", desperfecto.IdPresupuesto);
                    cmd.Parameters.AddWithValue("Descripcion", desperfecto.Descripcion);
                    cmd.Parameters.AddWithValue("ManoDeObra", desperfecto.ManoDeObra);
                    cmd.Parameters.AddWithValue("Tiempo", desperfecto.Tiempo);
                    cmd.Parameters.AddWithValue("Repuestos", desperfecto.Repuestos);

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

        public string Eliminar(int? IdDesperfecto)
        {
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.GetCadenaSQL()))
            {
                try
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("PRC_ELIMINAR_DESPERFECTO", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("IdDesperfecto", IdDesperfecto);

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
