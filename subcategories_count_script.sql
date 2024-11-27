-- Выборка количества подкатегорий для каждой категории
SELECT
	categories.name,
    COUNT(child_categories)
FROM
	categories
	LEFT JOIN categories AS child_categories
		ON categories.category_id = child_categories.parent_category_id
GROUP BY
	categories.name;
