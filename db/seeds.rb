# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Iniciando seeds..."

# Crear usuario admin
puts "Creando usuario admin..."
admin = User.find_or_create_by!(email: "admin@portfolio.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
  user.admin = true
end
puts "✓ Usuario admin creado: #{admin.email}"

# Crear categorías
puts "\nCreando categorías..."
categories_data = [
  "Desarrollo",
  "Diseño",
  "Tutoriales",
  "Reflexiones",
  "Proyectos"
]

categories = categories_data.map do |category_name|
  category = Category.find_or_create_by!(name: category_name)
  puts "✓ Categoría: #{category.name}"
  category
end

# Crear posts de ejemplo
puts "\nCreando posts de ejemplo..."

posts_data = [
  {
    title: "Bienvenido a mi blog personal",
    body: "Este es el primer post de mi blog. Aquí compartiré mis experiencias, aprendizajes y proyectos relacionados con el desarrollo web y la tecnología.\n\nMe apasiona crear soluciones elegantes y funcionales que resuelvan problemas reales. A través de este espacio, espero documentar mi viaje como desarrollador y diseñador.\n\nEspero que encuentres contenido útil e inspirador. ¡Gracias por estar aquí!",
    category: categories.find { |c| c.name == "Reflexiones" },
    status: "published",
    published_at: 3.days.ago
  },
  {
    title: "Introducción a Ruby on Rails 8",
    body: "Ruby on Rails 8 trae muchas mejoras emocionantes para el desarrollo web moderno. En este post, exploraremos las nuevas características más destacadas.\n\nAlgunas de las mejoras incluyen mejor rendimiento, nuevas utilidades para trabajar con JavaScript, y una experiencia de desarrollo más fluida.\n\nLas convenciones de Rails siguen siendo su mayor fortaleza, permitiendo a los desarrolladores enfocarse en resolver problemas de negocio en lugar de configuración.",
    category: categories.find { |c| c.name == "Desarrollo" },
    status: "published",
    published_at: 2.days.ago
  },
  {
    title: "Diseño responsive con Tailwind CSS",
    body: "Tailwind CSS ha revolucionado la forma en que pensamos sobre el diseño web. En este tutorial, veremos cómo crear interfaces completamente responsive.\n\nLa filosofía 'mobile-first' de Tailwind nos ayuda a construir experiencias que funcionan bien en cualquier dispositivo. Empezamos con el diseño móvil y luego añadimos mejoras progresivas para pantallas más grandes.\n\nAlgunos tips clave: usa flex y grid para layouts flexibles, aprovecha las utilidades responsive (sm:, md:, lg:), y siempre prueba en dispositivos reales.",
    category: categories.find { |c| c.name == "Diseño" },
    status: "published",
    published_at: 1.day.ago
  },
  {
    title: "Cómo configurar un proyecto Rails desde cero",
    body: "En este tutorial paso a paso, aprenderás a configurar un proyecto Rails completo desde cero, incluyendo la base de datos, autenticación y despliegue.\n\nComenzaremos con 'rails new' y avanzaremos configurando cada aspecto del proyecto: modelos, controladores, vistas, y las mejores prácticas de seguridad.\n\nAl final, tendrás un proyecto completamente funcional listo para producción. Incluiré también recomendaciones sobre testing y CI/CD.",
    category: categories.find { |c| c.name == "Tutoriales" },
    status: "published",
    published_at: Time.current
  },
  {
    title: "Mi stack tecnológico para 2026",
    body: "Este año he decidido enfocarme en un stack sólido y probado: Rails para el backend, Hotwire para interactividad sin JavaScript pesado, y Tailwind para el diseño.\n\nLa combinación de Rails con Hotwire (Turbo + Stimulus) ofrece una experiencia de desarrollo increíblemente productiva, sin la complejidad de frameworks JavaScript separados.\n\nCon PostgreSQL como base de datos y despliegues en servicios modernos, este stack me permite construir aplicaciones robustas rápidamente.",
    category: categories.find { |c| c.name == "Reflexiones" },
    status: "published",
    published_at: Time.current
  },
  {
    title: "Próximamente: Sistema de comentarios",
    body: "Estoy trabajando en implementar un sistema de comentarios para este blog. Será una característica interesante que permitirá mayor interacción.\n\nLa implementación incluirá moderación, notificaciones por email, y protección contra spam. También estoy considerando agregar Markdown support para los comentarios.\n\nEspero tenerlo listo pronto. Mantente atento a las actualizaciones.",
    category: categories.find { |c| c.name == "Proyectos" },
    status: "draft",
    published_at: nil
  }
]

posts_data.each do |post_data|
  post = Post.find_or_create_by!(title: post_data[:title]) do |p|
    p.body = post_data[:body]
    p.category = post_data[:category]
    p.status = post_data[:status]
    p.published_at = post_data[:published_at]
  end
  status_emoji = post.published? ? "✓" : "○"
  puts "#{status_emoji} Post: #{post.title} (#{post.status})"
end

puts "\n🎉 Seeds completados exitosamente!"
puts "\n📊 Resumen:"
puts "   Usuarios: #{User.count}"
puts "   Categorías: #{Category.count}"
puts "   Posts: #{Post.count} (#{Post.published.count} publicados, #{Post.draft.count} borradores)"
puts "\n🔐 Credenciales de admin:"
puts "   Email: admin@portfolio.com"
puts "   Password: password123"
