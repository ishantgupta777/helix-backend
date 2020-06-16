module.exports = (sequelize, Sequelize) => {
    const Events = sequelize.define(
        'events',
        {
            evt_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
            },
            user_id: { type: Sequelize.INTEGER, allowNull: false },
            evt_name: { type: Sequelize.STRING(20), allowNull: false },
            evt_date: { type: Sequelize.STRING(20), defaultValue: null },
            evt_time: { type: Sequelize.STRING(20), allowNull: false },
            evt_genre: { type: Sequelize.STRING(50), allowNull: false },
            evt_image_link: { type: Sequelize.STRING(100), allowNull: false },
            evt_desc: { type: Sequelize.STRING(50), defaultValue: null },
            evt_deleted: { type: Sequelize.BOOLEAN, defaultValue: null },
            
        },
        {
            timestamps: false,
        }
    );

    return Events;
};
