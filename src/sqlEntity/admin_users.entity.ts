import {
    AfterLoad,
    BaseEntity,
    BeforeInsert,
    BeforeUpdate,
    Column,
    Entity,
    PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('admin_user')
export class AdminUser extends BaseEntity {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column('varchar', { nullable: true })
    email: string;

    @Column('varchar', { nullable: true })
    password: string;

    @Column('text', { nullable: true })
    token: string;

    @Column('datetime')
    last_login: Date;

    @Column('timestamp')
    created_at: Date;

    @Column('timestamp')
    updated_at: Date;

    @BeforeInsert()
    private beforeInsert(): void {
        this.created_at = new Date();
        this.updated_at = new Date();
    }

    @BeforeUpdate()
    private beforeUpdate(): void {
        this.updated_at = new Date();
    }

    @AfterLoad()
    private afterFetch(): void {
        delete this.created_at;
        delete this.updated_at;
    }
}
